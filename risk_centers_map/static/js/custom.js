var riskManagement = {

        riskMap: null,
        base_url: "http://192.168.31.129:8000",

        markersList: {
            "evacuation_centers": [],
            "pickup_points": [],
            "facilities": []
        },

        brgyBoundariesList: [],
        cauayanCityBoundaries: null,

        testAlert: (passed_id) => {
            alert('test alert:' + $(passed_id).attr('id'));
        },

        pullCityBoundaries: () => {
            // riskManagement.cauayanCityBoundaries.setMap(null);
            // riskManagement.cauayanCityBoundaries = null

            $.get(riskManagement.base_url + "/api/boundaries/0", (data, textStatus, jqXHR) => {
                const cauayan_poly_coords = data.data
                const city_political_boundary = new google.maps.Polygon({
                    // paths: cauayan_poly_coords,
                    paths: cauayan_poly_coords,
                    strokeColor: "#3F4D4F",
                    strokeOpacity: 0.8,
                    strokeWeight: 3,
                    fillColor: "#FFFF00",
                    fillOpacity: 0.0
                });
                riskManagement.cauayanCityBoundaries = city_political_boundary;
                city_political_boundary.setMap(riskManagement.riskMap);
            });
        },

        pullBarangayBoundaries: () => {
            $.get(riskManagement.base_url + "/api/boundaries/1", (data, textStatus, jqXHR) => {
                brgy_list = data.data;
                for (let i = 0; i < brgy_list.length; i++) {
                    brgy_list_elem = brgy_list[i]
                    console.log(brgy_list_elem);

                    const brgy_polygon_elem = new google.maps.Polygon({
                        paths: brgy_list_elem["political_boundaries"],
                        strokeColor: "#571818",
                        strokeOpacity: 1,
                        strokeWeight: 2,
                        // fillColor: "#ddf542",
                        fillOpacity: 0
                    });

                    // riskManagement.brgyBoundariesList.append(brgy_polygon_elem);
                    brgy_polygon_elem.setMap(riskManagement.riskMap);

                };
            });
        },

        initMap: () => {
            const cauayan_city = {lat: 16.869419, lng: 121.801228};
            riskManagement.riskMap = new google.maps.Map(document.getElementById("render-map"), {
                zoom:12,
                center: cauayan_city,
                mapTypeId: "terrain",
                // center: cauayan_city
            });

            // Load default map elements
            riskManagement.pullCityBoundaries();
            riskManagement.pullBarangayBoundaries();
        },

        markerClickEvent: (target_object) => {
            console.log(target_object.get("id"));
            // alert(target_object.attr("ssid"));
        },

        createMarker: () => {

            $.get( riskManagement.base_url + "/api/markers/0", (data, textStatus, jqXHR) => {
                markers_list_data = data;
            
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
                                    url: riskManagement.base_url + "/static/icons/house.png", // url
                                    scaledSize: new google.maps.Size(30, 30), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            case "pickup_points":
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/taxi.png", // url
                                    scaledSize: new google.maps.Size(30, 30), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            case "facilities":
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/hospital.png", // url
                                    scaledSize: new google.maps.Size(30, 30), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            default:
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/call.png", // url
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
            });

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