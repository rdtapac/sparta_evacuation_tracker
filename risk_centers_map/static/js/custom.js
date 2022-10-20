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
            $.get("http://192.168.31.129:8000/api/boundaries/0", (data, textStatus, jqXHR) => {
                const cauayan_poly_coords = data.coords_list
                const city_political_boundary = new google.maps.Polygon({
                    // paths: cauayan_poly_coords,
                    paths: cauayan_poly_coords,
                    strokeColor: "#A85E32",
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: "#FFFF00"
                });
                city_political_boundary.setMap(riskManagement.riskMap);
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

          

            riskManagement.pullCityBoundaries();
        },

        markerClickEvent: (target_object) => {
            console.log(target_object.get("id"));
            // alert(target_object.attr("ssid"));
        },

        createMarker: () => {

            $.get("http://192.168.31.129:8000/api/markers/0", (data, textStatus, jqXHR) => {
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