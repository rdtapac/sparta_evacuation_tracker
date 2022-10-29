var riskManagement = {

        riskMap: null,
        base_url: "http://192.168.31.129:8000",

        markerTypes: {
            "evacuation_centers": {marker_type_id: 0, marker_type_label: "Evacuation Center"},
            "facilities": {marker_type_id: 1, marker_type_label: "Facility"}
        },

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

        returnMarkerArrayKeyElem: (marker_id) => {
            let marker_array_key = null;
            switch(marker_id) {
                case 1:
                    marker_array_key = 'facilities';
                    break;
                default:
                    marker_array_key = 'evacuation_centers';
            }
            return marker_array_key;
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
                    // console.log(brgy_list_elem);
                    let poly_color = '#33CC33';
                    let stroke_color = '#196619';

                    const brgy_polygon_elem = new google.maps.Polygon({
                        paths: brgy_list_elem["political_boundaries"],
                        // strokeColor: "#571818",
                        strokeColor: stroke_color,
                        strokeOpacity: 1,
                        strokeWeight: 2,
                        fillColor: poly_color,  
                        // fillColor: "#ddf542",
                        // fillOpacity: 0
                    });

                    // riskManagement.brgyBoundariesList.append(brgy_polygon_elem);
                    brgy_polygon_elem.setMap(riskManagement.riskMap);

                };
            });
        },

        initMap: () => {
            // const center_cauayan_city = {lat: 16.869419, lng: 121.801228};
            const center_cauayan_city = {lat: 16.93434824674571, lng: 121.77511437674198};
            riskManagement.riskMap = new google.maps.Map(document.getElementById("renderMap"), {
                zoom:13,
                center: center_cauayan_city,
                mapTypeId: "roadmap",
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

        pullMarkersFromAPI: (obj_marker_type_elem) => {

            var marker_type_id = obj_marker_type_elem.marker_type_id

            // $.get( riskManagement.base_url + "/api/markers/" + marker_type_id, (data, textStatus, jqXHR) => {
            $.getJSON( riskManagement.base_url + "/api/markers/" + marker_type_id, (data) => {

                let marker_type_label = obj_marker_type_elem.marker_type_label
                let markers_list_data = data.data;
                let marker_storage_key_ref = riskManagement.returnMarkerArrayKeyElem(marker_type_id)

                // Loop througout the markers current row dataset
                markers_list_data.forEach( (marker_list_elem) => {

                    // choose marker appearance
                    switch(marker_storage_key_ref) {
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

                    // Create info window content
                    google.maps.InfoWindow.prototype.opened = false;
                    obj_info_window = new google.maps.InfoWindow();
                    obj_map = riskManagement.riskMap;

                    // set marker event
                    new_marker.addListener("click", ()=>{
                        if (!google.maps.InfoWindow.prototype.opened) {
                            google.maps.InfoWindow.prototype.opened = true;
                            obj_info_window.open({
                                anchor: new_marker,
                                obj_map
                            });
                        }  else {
                            google.maps.InfoWindow.prototype.opened = false;
                            obj_info_window.close()
                        }
                        let content_info_window_id = "content_window";
                        obj_info_window.setContent(`<div id="${content_info_window_id}"></div>`);

                        // obj_info_window.open({
                        //     anchor: new_marker,
                        //     obj_map
                        // });

                        if (('additional_attributes' in marker_list_elem) 
                        && (marker_list_elem['additional_attributes']['is_evacuation_center']) ) {
                            marker_type_label = "Evacuation Center";
                            console.log("must be evac center")
                        }    

                        console.log(marker_type_label)

                        // var content_info_window_id = "content_" + marker_list_elem["marker_id"];
                        

                        var str_info_window_contents =`
                        <div id="${content_info_window_id}">
                            <div><h4 class="markerHeading">${marker_list_elem['label']}</h4></div>
                            <div><b>${marker_type_label}</b></div>
                            <div><b>Address:</b>&nbsp;${marker_list_elem["address"]}</div>
                            <div class="content-additional-attributes>${additional_attributes}</div>
                            <div id="info_additional_contents"></div>
                        </div>
                        `;

                        obj_info_window.setContent(str_info_window_contents);

                        console.log(marker_list_elem)
                        
                        if ('additional_attributes' in marker_list_elem) {
                            console.log('has attributes');
                            let additional_attr = marker_list_elem["additional_attributes"];
                            
                            let status_active = (additional_attr["date_active_end"]) ? 'Not active' : 'Active';

                            var additional_attributes = `
                            <div><b>Status:</b>&nbsp;${status_active}</div>
                            <div><b>Established on:</b>&nbsp;${additional_attr["date_active_start"]}</div>
                            `;
                            $("#" + content_info_window_id).append(additional_attributes);                        
                        }
                        
                        riskManagement.markerClickEvent(new_marker);

                    });

                    // push to marker storage list
                    riskManagement.markersList[marker_storage_key_ref].push(new_marker);


                });
            });
        },

        loadInitMarkers: () => {
            // Loop througout the marker types
            for (const marker_type_key of Object.keys(riskManagement.markerTypes)) {
                console.log(riskManagement.markerTypes[marker_type_key]);
                riskManagement.pullMarkersFromAPI(riskManagement.markerTypes[marker_type_key]);
            }
        },

        removeMarkers: (marker_id) => {
            let marker_array_key = riskManagement.returnMarkerArrayKeyElem(marker_id);
            riskManagement.markersList[marker_array_key].map( (mapMarker) => {
                mapMarker.setMap(null);
            });
            riskManagement.markersList[marker_array_key] = []   
        },

        loadMarkers: (marker_id) => {
            let marker_array_key = riskManagement.returnMarkerArrayKeyElem(marker_id);
        },

        init: () => {
            // load elements during init
            riskManagement.loadInitMarkers();

            // Set events during init
            $(".map-marker-checkbox").on("click", (e) => {

                let marker_key_ref_elem = null;
                let marker_idx_ref_elem = null;

                switch (e.target.id){
                    case "chkbxFacilities":
                        marker_key_ref_elem = "facilities";
                        marker_idx_ref_elem = 1;
                        break;
                    default:
                        marker_key_ref_elem = "evacuation_centers";
                        marker_idx_ref_elem = 0;
                }
                if ($(e.target).is(":checked")) {
                    riskManagement.pullMarkersFromAPI(riskManagement.markerTypes[marker_key_ref_elem]);
                } else {
                    riskManagement.removeMarkers(marker_idx_ref_elem);
                }

            });            
            // TODO: add barangay province on left panel if polygon in clicked
            
        
            $('#test-button').click(()=> {
                $('#barangayInfo').modal('show');
            } )
        }
};


$(document).ready(function(){
    // rm = new riskManagement()
    // rm.init();
    riskManagement.init();
});