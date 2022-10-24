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
            console.log(target_object.get("marker_id"));
            // alert(target_object.attr("ssid"));
        },

        createMarker: () => {

            let marker_types = [
                {marker_type_id: 0, marker_type_label: "Evacuation Centers"},
                {marker_type_id: 1, marker_type_label: "Facilities"}
            ];

            // Loop througout the marker types
            marker_types.forEach( (marker_type_elem) => {
                let marker_type_id = marker_type_elem.marker_type_id
                let marker_type_label = marker_type_elem.marker_type_label

                $.get( riskManagement.base_url + "/api/markers/" + marker_type_id, (data, textStatus, jqXHR) => {
                    markers_list_data = data.data;
                    console.log(markers_list_data);

                    if (marker_type_id == 0) {
                        marker_storage_ref_key = "evacuation_centers";
                    } else if (marker_type_id == 1) {
                        marker_storage_ref_key = "facilities";
                    }

                    // Loop througout the markers current row dataset
                    markers_list_data.forEach( (marker_list_elem) => {

                        // choose marker appearance
                        switch(marker_storage_ref_key) {
                            case "evacuation_centers":
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/house.png", // url
                                    scaledSize: new google.maps.Size(35, 35), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            case "pickup_points":
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/taxi.png", // url
                                    scaledSize: new google.maps.Size(35, 35), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            case "facilities":
                                var icon_param = {
                                    url: riskManagement.base_url + "/static/icons/hospital.png", // url
                                    scaledSize: new google.maps.Size(35, 35), // scaled size
                                    origin: new google.maps.Point(0,0), // origin
                                    anchor: new google.maps.Point(0, 0) // anchor
                                };
                                break;
                            default:
                                var icon_param = null
                        }

                        // Create actual marker
                        let new_marker = new google.maps.Marker({
                            position: marker_list_elem["coordinates"],
                            label: marker_list_elem["label"],
                            // icon: new google.maps.MarkerImage('http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_green.png')
                            icon: (icon_param) ? icon_param : null
                        });
            
                        // set additional marker attributes
                        new_marker.set("id", marker_list_elem["id"])
                        new_marker.set("marker_id", marker_list_elem["marker_id"])
                        new_marker.setMap(riskManagement.riskMap);

                        // set marker event
                        new_marker.addListener("click", ()=>{
                            riskManagement.markerClickEvent(new_marker);
                        });

                        // push to marker storage list
                        riskManagement.markersList[marker_storage_ref_key].push(new_marker);


                    });
                });
            });
        },

        init: () => {
            // load elements during init
            riskManagement.createMarker();

            // set events during init
            $('#chkbxEvac').click(() => {riskManagement.testAlert(this)});
            $('#test-button').click(()=> {riskManagement.createMarker()} )
        }
};


$(document).ready(function(){
    // rm = new riskManagement()
    // rm.init();
    riskManagement.init();
});