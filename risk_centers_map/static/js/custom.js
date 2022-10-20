var riskManagement = {

        riskMap: null,

        markersList: {
            "evacuation_centers": [1, 2, 3, 4, 5],
            "pickup_points": [],
            "facilities": []
        },

        testAlert: (passed_id) => {
            alert('test alert:' + $(passed_id).attr('id'));
        },

        pullCityBoundaries: () => {
            const cauayan_poly_coords = [
                {lng:121.800117, lat:16.981609},
                {lng:121.802727, lat:16.981520},
                {lng:121.805511, lat:16.981800},
                {lng:121.806808, lat:16.981930},
                {lng:121.808510, lat:16.981819},
                {lng:121.811600, lat:16.981449},
                {lng:121.813873, lat:16.981020},
                {lng:121.816681, lat:16.980190},
                {lng:121.819344, lat:16.979130},
                {lng:121.821053, lat:16.978550},
                {lng:121.823097, lat:16.976450},
                {lng:121.827141, lat:16.974621},
                {lng:121.829391, lat:16.973881},
                {lng:121.831963, lat:16.973909},
                {lng:121.833839, lat:16.974319},
                {lng:121.834480, lat:16.974609},
                {lng:121.836342, lat:16.971291},
                {lng:121.837723, lat:16.968349},
                {lng:121.838043, lat:16.967590},
                {lng:121.838226, lat:16.965931},
                {lng:121.837578, lat:16.964729},
                {lng:121.836090, lat:16.963820},
                {lng:121.835289, lat:16.963381},
                {lng:121.834633, lat:16.963120},
                {lng:121.834099, lat:16.961990},
                {lng:121.835716, lat:16.961519},
                {lng:121.837662, lat:16.961281},
                {lng:121.838638, lat:16.960911},
                {lng:121.840530, lat:16.959089},
                {lng:121.840843, lat:16.957359},
                {lng:121.840057, lat:16.956020},
                {lng:121.839661, lat:16.954920},
                {lng:121.840073, lat:16.953960},
                {lng:121.842827, lat:16.951559},
                {lng:121.842529, lat:16.950390},
                {lng:121.842651, lat:16.948231},
                {lng:121.844307, lat:16.947670},
                {lng:121.845222, lat:16.947821},
                {lng:121.846291, lat:16.945721},
                {lng:121.847366, lat:16.945761},
                {lng:121.847397, lat:16.944740},
                {lng:121.847328, lat:16.944071},
                {lng:121.847137, lat:16.941561},
                {lng:121.846420, lat:16.939350},
                {lng:121.845863, lat:16.937290},
                {lng:121.845917, lat:16.936850},
                {lng:121.847427, lat:16.937300},
                {lng:121.848633, lat:16.937691},
                {lng:121.849457, lat:16.935169},
                {lng:121.850182, lat:16.932949},
                {lng:121.850517, lat:16.932541},
                {lng:121.852348, lat:16.932541},
                {lng:121.854309, lat:16.934031},
                {lng:121.855133, lat:16.934940},
                {lng:121.856003, lat:16.937290},
                {lng:121.857567, lat:16.936911},
                {lng:121.858673, lat:16.936460},
                {lng:121.860687, lat:16.937740},
                {lng:121.863037, lat:16.937941},
                {lng:121.865334, lat:16.937380},
                {lng:121.865662, lat:16.936899},
                {lng:121.864647, lat:16.935310},
                {lng:121.865128, lat:16.933981},
                {lng:121.866432, lat:16.932199},
                {lng:121.866760, lat:16.931471},
                {lng:121.865799, lat:16.930090},
                {lng:121.864662, lat:16.929001},
                {lng:121.864029, lat:16.927811},
                {lng:121.865097, lat:16.926580},
                {lng:121.865921, lat:16.925310},
                {lng:121.866272, lat:16.924110},
                {lng:121.868187, lat:16.922720},
                {lng:121.868507, lat:16.922741},
                {lng:121.871117, lat:16.923059},
                {lng:121.872368, lat:16.922810},
                {lng:121.873528, lat:16.922319},
                {lng:121.873909, lat:16.921591},
                {lng:121.874832, lat:16.920300},
                {lng:121.875618, lat:16.920401},
                {lng:121.877220, lat:16.921221},
                {lng:121.877861, lat:16.920670},
                {lng:121.880188, lat:16.919849},
                {lng:121.880638, lat:16.920191},
                {lng:121.881523, lat:16.920429},
                {lng:121.882767, lat:16.920891},
                {lng:121.883842, lat:16.920931},
                {lng:121.884941, lat:16.920931},
                {lng:121.886253, lat:16.921141},
                {lng:121.887611, lat:16.921400},
                {lng:121.889320, lat:16.922251},
                {lng:121.890717, lat:16.922859},
                {lng:121.891930, lat:16.922371},
                {lng:121.891129, lat:16.920509},
                {lng:121.890480, lat:16.919621},
                {lng:121.890587, lat:16.918261},
                {lng:121.890999, lat:16.916880},
                {lng:121.892548, lat:16.914850},
                {lng:121.893066, lat:16.914120},
                {lng:121.893608, lat:16.912861},
                {lng:121.894058, lat:16.911699},
                {lng:121.895126, lat:16.911150},
                {lng:121.896019, lat:16.910170},
                {lng:121.896797, lat:16.909330},
                {lng:121.897926, lat:16.908470},
                {lng:121.898773, lat:16.907921},
                {lng:121.899971, lat:16.907730},
                {lng:121.900780, lat:16.908480},
                {lng:121.901520, lat:16.909210},
                {lng:121.902161, lat:16.908581},
                {lng:121.903252, lat:16.908251},
                {lng:121.905281, lat:16.907770},
                {lng:121.905853, lat:16.906981},
                {lng:121.905952, lat:16.905310},
                {lng:121.905472, lat:16.904430},
                {lng:121.904404, lat:16.902830},
                {lng:121.904984, lat:16.900370},
                {lng:121.904984, lat:16.898809},
                {lng:121.904739, lat:16.895710},
                {lng:121.904617, lat:16.894260},
                {lng:121.905167, lat:16.893400},
                {lng:121.906921, lat:16.893141},
                {lng:121.909363, lat:16.893270},
                {lng:121.909943, lat:16.892920},
                {lng:121.909920, lat:16.892250},
                {lng:121.909813, lat:16.890591},
                {lng:121.909332, lat:16.889549},
                {lng:121.908669, lat:16.888460},
                {lng:121.907867, lat:16.887409},
                {lng:121.907944, lat:16.886780},
                {lng:121.909477, lat:16.886530},
                {lng:121.911926, lat:16.886250},
                {lng:121.914284, lat:16.886129},
                {lng:121.918159, lat:16.885710},
                {lng:121.922813, lat:16.885370},
                {lng:121.926720, lat:16.885000},
                {lng:121.932121, lat:16.884970},
                {lng:121.933357, lat:16.883760},
                {lng:121.933434, lat:16.882271},
                {lng:121.933746, lat:16.881350},
                {lng:121.933907, lat:16.879660},
                {lng:121.934692, lat:16.879271},
                {lng:121.935760, lat:16.878000},
                {lng:121.935921, lat:16.875931},
                {lng:121.935349, lat:16.874140},
                {lng:121.933792, lat:16.872919},
                {lng:121.932220, lat:16.871861},
                {lng:121.931381, lat:16.870110},
                {lng:121.931084, lat:16.868349},
                {lng:121.930099, lat:16.867599},
                {lng:121.928917, lat:16.866550},
                {lng:121.925987, lat:16.864719},
                {lng:121.924316, lat:16.863569},
                {lng:121.922508, lat:16.862640},
                {lng:121.919937, lat:16.861500},
                {lng:121.913353, lat:16.859470},
                {lng:121.910820, lat:16.858400},
                {lng:121.908897, lat:16.857220},
                {lng:121.906219, lat:16.855539},
                {lng:121.905792, lat:16.855570},
                {lng:121.904167, lat:16.854561},
                {lng:121.902023, lat:16.853201},
                {lng:121.900513, lat:16.852221},
                {lng:121.898323, lat:16.850491},
                {lng:121.897041, lat:16.849140},
                {lng:121.894753, lat:16.845869},
                {lng:121.893867, lat:16.844980},
                {lng:121.892036, lat:16.842920},
                {lng:121.890312, lat:16.841700},
                {lng:121.886948, lat:16.838369},
                {lng:121.883438, lat:16.835779},
                {lng:121.877663, lat:16.832340},
                {lng:121.875481, lat:16.830481},
                {lng:121.871834, lat:16.840611},
                {lng:121.868408, lat:16.842331},
                {lng:121.855583, lat:16.840830},
                {lng:121.850258, lat:16.839581},
                {lng:121.846039, lat:16.838810},
                {lng:121.844421, lat:16.838690},
                {lng:121.842949, lat:16.838779},
                {lng:121.840607, lat:16.838100},
                {lng:121.834007, lat:16.836090},
                {lng:121.830856, lat:16.835449},
                {lng:121.828491, lat:16.835699},
                {lng:121.823601, lat:16.835751},
                {lng:121.817291, lat:16.836361},
                {lng:121.814171, lat:16.836809},
                {lng:121.802353, lat:16.834160},
                {lng:121.802544, lat:16.836281},
                {lng:121.795731, lat:16.840561},
                {lng:121.795097, lat:16.850420},
                {lng:121.788422, lat:16.851320},
                {lng:121.774147, lat:16.851030},
                {lng:121.769737, lat:16.855780},
                {lng:121.765602, lat:16.859470},
                {lng:121.762039, lat:16.859190},
                {lng:121.760483, lat:16.859020},
                {lng:121.759682, lat:16.859209},
                {lng:121.756889, lat:16.858521},
                {lng:121.755859, lat:16.858299},
                {lng:121.754753, lat:16.858170},
                {lng:121.754059, lat:16.858250},
                {lng:121.752647, lat:16.857800},
                {lng:121.751091, lat:16.857470},
                {lng:121.750366, lat:16.857611},
                {lng:121.748817, lat:16.857031},
                {lng:121.747597, lat:16.856930},
                {lng:121.746742, lat:16.857281},
                {lng:121.745354, lat:16.856791},
                {lng:121.743874, lat:16.857040},
                {lng:121.722794, lat:16.861010},
                {lng:121.715446, lat:16.862419},
                {lng:121.694572, lat:16.867519},
                {lng:121.682510, lat:16.870291},
                {lng:121.677101, lat:16.871559},
                {lng:121.673920, lat:16.871941},
                {lng:121.671471, lat:16.872351},
                {lng:121.667992, lat:16.873360},
                {lng:121.663628, lat:16.874250},
                {lng:121.661346, lat:16.874041},
                {lng:121.658829, lat:16.875200},
                {lng:121.656860, lat:16.876459},
                {lng:121.651207, lat:16.878780},
                {lng:121.661636, lat:16.887280},
                {lng:121.673203, lat:16.896540},
                {lng:121.674156, lat:16.903820},
                {lng:121.675148, lat:16.903620},
                {lng:121.675613, lat:16.903160},
                {lng:121.676331, lat:16.902691},
                {lng:121.676468, lat:16.902840},
                {lng:121.678268, lat:16.903839},
                {lng:121.679108, lat:16.903561},
                {lng:121.679871, lat:16.903210},
                {lng:121.680817, lat:16.902941},
                {lng:121.682159, lat:16.903311},
                {lng:121.682808, lat:16.903709},
                {lng:121.683090, lat:16.903891},
                {lng:121.684410, lat:16.904400},
                {lng:121.684837, lat:16.904350},
                {lng:121.686623, lat:16.904659},
                {lng:121.688477, lat:16.905451},
                {lng:121.689339, lat:16.905701},
                {lng:121.690498, lat:16.906071},
                {lng:121.691582, lat:16.906500},
                {lng:121.692543, lat:16.906639},
                {lng:121.693916, lat:16.906509},
                {lng:121.694992, lat:16.907301},
                {lng:121.695686, lat:16.908291},
                {lng:121.695717, lat:16.909100},
                {lng:121.696037, lat:16.910851},
                {lng:121.696136, lat:16.911501},
                {lng:121.697983, lat:16.912430},
                {lng:121.697983, lat:16.913219},
                {lng:121.698563, lat:16.913231},
                {lng:121.699387, lat:16.913549},
                {lng:121.699799, lat:16.914539},
                {lng:121.700394, lat:16.915060},
                {lng:121.701027, lat:16.916410},
                {lng:121.700897, lat:16.917030},
                {lng:121.701630, lat:16.918341},
                {lng:121.700760, lat:16.920290},
                {lng:121.700912, lat:16.922119},
                {lng:121.702522, lat:16.924620},
                {lng:121.704117, lat:16.926430},
                {lng:121.704803, lat:16.926701},
                {lng:121.706047, lat:16.927530},
                {lng:121.708427, lat:16.930050},
                {lng:121.709167, lat:16.930780},
                {lng:121.712173, lat:16.931589},
                {lng:121.715378, lat:16.931471},
                {lng:121.718224, lat:16.931339},
                {lng:121.720467, lat:16.931641},
                {lng:121.723373, lat:16.931919},
                {lng:121.725838, lat:16.932961},
                {lng:121.727997, lat:16.933571},
                {lng:121.729210, lat:16.933889},
                {lng:121.729507, lat:16.933969},
                {lng:121.729317, lat:16.936291},
                {lng:121.735123, lat:16.944170},
                {lng:121.736847, lat:16.946369},
                {lng:121.750168, lat:16.963579},
                {lng:121.751984, lat:16.965771},
                {lng:121.754143, lat:16.970699},
                {lng:121.764999, lat:16.985210},
                {lng:121.765907, lat:16.986031},
                {lng:121.776131, lat:16.984489},
                {lng:121.796219, lat:16.982210},
                {lng:121.797684, lat:16.981951},
                {lng:121.800117, lat:16.981609}
            ];

            const city_political_boundary = new google.maps.Polygon({
                // paths: cauayan_poly_coords,
                paths: cauayan_poly_coords,
                strokeColor: "#A85E32",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#FFFF00"
            });
            city_political_boundary.setMap(riskManagement.riskMap);
        },

        initMap: () => {
            const cauayan_city = {lat: 16.869419, lng: 121.801228};
            riskManagement.riskMap = new google.maps.Map(document.getElementById("render-map"), {
                zoom:12,
                center: cauayan_city,
                mapTypeId: "terrain",
                // center: cauayan_city
            });

          

            riskManagement.pullCityBoundaries();
        },

        markerClickEvent: (target_object) => {
            console.log(target_object.get("id"));
            // alert(target_object.attr("id"));
        },

        createMarker: () => {
            let temp_data = {
                "evacuation_centers": [
                    {
                        "label": "Evacuation Center 1",
                        "id": "e_center_1",
                        "coordinates": {lat: 16.87854037431313, lng: 121.85548420423102}
                    },
                    {
                        "label": "Evacuation Center 2",
                        "id": "e_center_2",
                        "coordinates": {lat: 16.939473443912565, lng: 121.76793690195545}
                    },
                    {
                        "label": "Evacuation Center 3",
                        "id": "e_center_3",
                        "coordinates": {lat: 16.942921896125124, lng: 121.77806492326522}
                    }
                ],
                "pickup_points": [
                    {
                        "label": "Pickup Point 1",
                        "id": "pickup_1",
                        "coordinates": {lat: 16.9302772623189, lng: 121.7990076113972}
                    },
                    {
                        "label": "Pickup Point 2",
                        "id": "pickup_2",
                        "coordinates": {lat: 16.885932227661485, lng: 121.67489643526515}
                    },
                    {
                        "label": "Pickup Point 3",
                        "id": "pickup_3",
                        "coordinates": {lat: 16.864741475060434, lng: 121.74201603398606}
                    }
                ],
                "facilities": [
                    {
                        "label": "Facility 1",
                        "id": "facility_1",
                        "coordinates": {lat: 16.948649752327544, lng: 121.77235492231901}
                    },
                    {
                        "label": "Facility 2",
                        "id": "facility_2",
                        "coordinates": {lat: 16.93912867057586, lng: 121.81872199673616}
                    },
                ],
            };

            "TODO: Create API that will pull the markers/pins"
            markers_list_data = temp_data;
            
            markers_list_keys = Object.keys(markers_list_data);
            markers_list_keys.forEach((marker_ref_key) => {
                let process_marker_list = markers_list_data[marker_ref_key];
                for (let process_marker_ctr = 0; process_marker_ctr < process_marker_list.length; process_marker_ctr++ ) {
                    process_elem = process_marker_list[process_marker_ctr];

                    if (process_marker_ctr > 10) {
                        alert('out of range')
                        break;
                    }

                    switch(marker_ref_key) {
                        case "evacuation_centers":
                            var icon_param = {
                                url: "http://192.168.31.129:8000/static/icons/house.png", // url
                                scaledSize: new google.maps.Size(30, 30), // scaled size
                                origin: new google.maps.Point(0,0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor
                            };
                            break;
                        case "pickup_points":
                            var icon_param = {
                                url: "http://192.168.31.129:8000/static/icons/taxi.png", // url
                                scaledSize: new google.maps.Size(30, 30), // scaled size
                                origin: new google.maps.Point(0,0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor
                            };
                            break;
                        case "facilities":
                            var icon_param = {
                                url: "http://192.168.31.129:8000/static/icons/hospital.png", // url
                                scaledSize: new google.maps.Size(30, 30), // scaled size
                                origin: new google.maps.Point(0,0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor
                            };
                            break;
                        default:
                            var icon_param = {
                                url: "http://192.168.31.129:8000/static/icons/call.png", // url
                                scaledSize: new google.maps.Size(30, 30), // scaled size
                                origin: new google.maps.Point(0,0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor
                            };
                            break;
                    }



                    // Create actual marker
                    let new_marker = new google.maps.Marker({
                        position: process_elem["coordinates"],
                        label: process_elem["label"],
                        // icon: new google.maps.MarkerImage('http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_green.png')
                        icon: icon_param
                    });
        
                    new_marker.set("id", process_elem["id"])
                    new_marker.setMap(riskManagement.riskMap);

                    console.log("marker id:" + process_elem["id"]);
                    console.log(process_elem);

                    new_marker.addListener("click", ()=>{
                        riskManagement.markerClickEvent(new_marker);
                    });
                    console.log("!!!");
                    // riskManagement.markersList[marker_ref_key].push(new_marker);

                }
            });

            console.log(riskManagement.markersList["evacuation_centers"]);

            // for (let marker_keys_ctr = 0; riskManagement.markersList.length ; marker_keys_ctr++) {
            //     console.log
            // }



            // test_marker = new google.maps.Marker({
            //     position: test_coordinates,
            //     label: "Test Marker"
            // });

            // test_marker.set("id", "marker_1")

            // test_marker.setMap(riskManagement.riskMap);
            // test_marker.addListener("click", ()=>{
            //     riskManagement.markerClickEvent(test_marker);
            // });

            // riskManagement.markersList["evacuation_centers"].push(test_marker);
            // // alert(test_marker.get("id"));
            // alert(riskManagement.markersList["evacuation_centers"]);
        },

        init: () => {
            $('#chkbxEvac').click(() => {riskManagement.testAlert(this)});
            $('#test-button').click(()=> {riskManagement.createMarker()} )
        }
};


$(document).ready(function(){
    // rm = new riskManagement()
    // rm.init();
    riskManagement.init();
});