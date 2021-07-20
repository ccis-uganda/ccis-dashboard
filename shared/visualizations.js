/*
 * groupBy String [optional], required if style = 'bar'
 *   either the name of a column or '[Age Groups]'
 * colorBy String [optional], required if style = 'pie'
 *   either the name of a column or '[Age Groups]'
 * repeatBy String [optional], either the name of a column or '[Age Groups]'
 * sort 'ASC'|'DESC' [optional], ascending or descending
 * style 'pie'|'bar'|'map', choose a chart type; `map` will automatically send
 *     Location_latitude and Location_longitude
 * mapType String [optional] is only
 *     supported for `style: 'map'`. 'maintenance_priority' is the only
 *     supported value so far.
 * facilityPopup Object [optional] should be used iff style is map
 *     can map columns within DB to 'COUNT' or 'SUM' to aggregate data
 *     within that column for each facility. can map to a list of distinct
 *     column values to count the number of occurrences for each for each facility.
 * filter Object [optional]
 * filter.regions Array of Strings [optional]
 * filter.facilityTypes Array of Strings [optional]
 * filter.refrigeratorTypes Array of Strings [optional]
 * filter.maintenancePriority String [optional]
 */
module.exports = {
    // CCEM table 3.3
    'Working status by refrigerator/freezer model': {
        groupBy: 'model_id',
        colorBy: 'functional_status',
        colorMap: {
            'functioning': 'blue',
            'not_functioning': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // Richard says this is also a CCEM chart
    'Age by refrigerator/freezer model': {
        groupBy: 'model_id',
        colorBy: '[Age Groups]',
        colorMap: {
            '0-5 Years': 'green',
            '6-10 Years': 'yellow',
            '>10 Years': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // CCEM chart 3.4
    'Refrigerators/freezers by working status': {
        groupBy: 'functional_status',
        colorBy: 'functional_status',
        colorMap: {
            'functioning': 'blue',
            'not_functioning': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // CCEM chart 3.4
    'Refrigerators/freezers by working status (pie)': {
        colorBy: 'functional_status',
        colorMap: {
            'functioning': 'blue',
            'not_functioning': 'red',
            'Missing data': 'gray'
        },
        style: 'pie'
    },
    // CCEM table 3.6b
    'Refrigerator/freezer utilization': {
        groupBy: 'model_id',
        colorBy: 'utilization',
        sort: 'DESC',
        colorMap: {
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // CCEM table 1.8
    'Electricity availability': {
        groupBy: 'grid_power_availability',
        colorBy: 'grid_power_availability',
        colorMap: {
            'more_than_16': 'green',
            '8_to_16': 'yellow',
            '4_to_8': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // CCEM table 1.8
    'Electricity availability (pie)': {
        colorBy: 'grid_power_availability',
        colorMap: {
            'more_than_16': 'green',
            '8_to_16': 'yellow',
            '4_to_8': 'red',
            'Missing data': 'gray'
        },
        style: 'pie'
    },
    // CCEM table 3.5a
    'Refrigerator/freezer models by age group': {
        groupBy: '[Age Groups]',
        colorBy: '[Age Groups]',
        sort: 'DESC',
        colorMap: {
            '0-5 Years': 'green',
            '6-10 Years': 'yellow',
            '>10 Years': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    // CCEM table 3.5a
    'Refrigerator/freezer models by age group (pie)': {
        colorBy: '[Age Groups]',
        sort: 'DESC',
        colorMap: {
            '0-5 Years': 'green',
            '6-10 Years': 'yellow',
            '>10 Years': 'red',
            'Missing data': 'gray'
        },
        style: 'pie'
    },
    // Maintenance priority map
    'Maintenance priority by facility': {
        // currently 'id_health_facilities' is the only supported groupBy value for maps
        groupBy: 'id_health_facilities',
        colorBy: 'maintenance_priority',
        mapType: 'maintenance_priority',
        style: 'map',
        facilityPopup: {
            'maintenance_priority': [ 'high', 'low', 'medium', 'not_applicable' ]
        }
    },
    // count of refrigerators for each classification
    // Note: Uses view in database, which will need to be updated if new ref types are added
    'Refrigerators/freezers by type(pie)': {
        colorBy: 'refrigerator_class',
        colorMap: {
            'ILR': 'blue',
            'Absorption' : 'red',
            'Freezer' : 'green',
            'Solar' : 'yellow',
            'Other' : 'purple',
            'Missing data' : 'gray'
        },
        style: 'pie'
    },
    'CCE model (bar)': {
        groupBy: 'model_id',
        colorBy: 'model_id',
        style: 'bar'
    },
    'CCE utilization (bar)': {
        groupBy: 'utilization',
        colorBy: 'utilization',
        style: 'bar'
    },
    'CCE maintenance priority (bar)': {
        groupBy: 'maintenance_priority',
        colorBy: 'maintenance_priority',
        colorMap: {
            'not_applicable': 'blue',
            'low': 'yellow',
            'medium': 'orange',
            'high': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    'Maintence priority by model': {
        groupBy: 'model_id',
        colorBy: 'maintenance_priority',
        colorMap: {
            'not_applicable': 'blue',
            'low': 'yellow',
            'medium': 'orange',
            'high': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    'CCE facility power availability by model': {
        groupBy: 'model_id',
        colorBy: 'grid_power_availability',
        colorMap: {
            'more_than_16': 'green',
            '8_to_16': 'yellow',
            '4_to_8': 'red',
            'Missing data': 'gray'
        },
        style: 'bar'
    },
    'CCE model by facility power availability': {
        groupBy: 'grid_power_availability',
        colorBy: 'model_id',
        style: 'bar'
    },
    'CCE model by facility type': {
        groupBy: 'facility_level',
        colorBy: 'model_id',
        style: 'bar'
    },
    'Facility type by CCE model': {
        groupBy: 'model_id',
        colorBy: 'facility_level',
        style: 'bar'
    }
};
