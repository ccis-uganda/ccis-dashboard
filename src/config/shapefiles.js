const level2Uganda = require('./Uganda_Regions_2020.json');
const level3Uganda = require('./Uganda_Districts_2020.json');

// `shapefiles.regionNameKeys` and `shapefiles.levels` have the same length.
// `regionNameKeys[i]` corresponds to `levels[i]` and to `levelNames[i]`.
// Unfortunately, the levels here are also coupled to the backend file
// controller/filterSpecification.js which describes how to look up these levels
// in the database
module.exports = {
    levelNames: [ 'Region (Level 2)', 'District (Level 3)' ],
    dbLevelNames: [ 'regionlevel2', 'regionlevel3' ],
    levels: [ level2Uganda, level3Uganda ],
    // The map will only show boundaries between these two levels
    // Each must be an element of levelNames
    // `topLevel` must come before `bottomLevel` in `levelNames` and `levels`
    topLevel: 'Region (Level 2)',
    bottomLevel: 'District (Level 3)',
    // This defines where to look up the level names: the strings here are keys
    // to the `properties` object of an individual geoJSON Feature
    regionNameKeys: [ 'ccisRegionName', 'ccisDistrictName' ]
};
