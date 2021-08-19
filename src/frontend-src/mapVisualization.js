const eachSeries = require('async/eachSeries')
const makeMarkerInfo = require('./coordinates');
const mapDisplay = require('../config/mapDisplay').mapVisualization;
const select = require('./selectors');
const maps = {};

function _drawMarker(mapboxgl, tabLabel, map, marker) {
    // create a DOM element for the marker
    const el = document.createElement('div');
    el.className = 'marker';
    el.style.backgroundImage = marker.iconImage;
    el.style.backgroundSize = 'contain';
    el.style.width = marker.iconSize[0];
    el.style.height = marker.iconSize[1];
    // add marker to map
    const markerObj = new mapboxgl.Marker({element: el})
        .setLngLat(marker.coordinates)
        .setPopup(new mapboxgl.Popup({
            offset: 10,
            closeButton: true,
            closeOnClick: true
        }).setHTML(`<h3> ${marker.title}
            </h3><p> ${marker.description} </p>`))
        .addTo(map);
    maps[tabLabel].markers.push(markerObj);
}

/*
 * If a map already exists for this tab, this will clear all
 * markers. Otherwise, creates a map from the makeMap function.
*/
async function setUpMap( makeMap,tabLabel) {
    if (!maps[tabLabel]) {
        maps[tabLabel] = {map: await makeMap(mapDisplay, select.mapContainer(tabLabel)), 
                          markers: []};
    } else {
        maps[tabLabel].markers.forEach(marker => marker.remove());
    }
    return maps[tabLabel].map;
}

/*
 * mapboxgl: [Injected dependency] The object exported by the mapbox-gl package;
 *     we pass it as a parameter instead of requiring it to support testing
 * makeMap: [Injected dependency] The function exported by map.js
 * data: array of data in map format, see coordinates.js for more info
 * mapType: String, currently only 'maintenance_priority' is supported
 */
async function mapVisualization({ mapboxgl, makeMap }, data, { mapType }, tabLabel) {
    const map = await setUpMap(makeMap, tabLabel);
    const drawMarker = _drawMarker.bind({}, mapboxgl, tabLabel, map);

    // Add markers 250 at a time
    const BATCH_SIZE = 250;
    const markerBatches = Array();
    for (let i = 0; i < data.length; i += BATCH_SIZE) {
        markerBatches.push(data.slice(i, i + BATCH_SIZE));
    }

    // Note: we return the map object before these asynchronous operations
    // complete
    eachSeries(markerBatches, (batch, next) => {
        const markers = makeMarkerInfo(batch, mapType);
        markers.filter(x => x !== null).forEach(drawMarker);
        setTimeout(next, 0);
    });
    return map;
};

function removeMap(tabLabel) {
    delete maps[tabLabel];
}

module.exports = {mapVisualization, removeMap}