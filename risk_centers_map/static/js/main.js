var riskManagement = {

        riskMap: null,
        base_url: "http://192.168.31.129:8000",
        infoModal: null,

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
                    paths: cauayan_poly_coords,
                    strokeColor: "#3F4D4F",
                    strokeOpacity: 0.8,
                    strokeWeight: 3,
                    fillColor: "#FFFF00",
                    fillOpacity: 0.0,
                    zIndex: 1
                });
                riskManagement.cauayanCityBoundaries = city_political_boundary;
                city_political_boundary.setMap(riskManagement.riskMap);
            });
        },

        pullBarangayBoundaries: () => {
            
            riskManagement.infoModal = new bootstrap.Modal(document.getElementById('barangayInfoModal'), {});

            $.getJSON(riskManagement.base_url + "/api/boundaries/1", (data, textStatus, jqXHR) => {
                var brgy_list = data.data;
                var brgy_polygon_elem = null;
                var label_style = null;

                brgy_list.forEach( (brgy_list_elem) => {
                    let poly_color = '#33CC33';
                    let stroke_color = '#196619';

                    switch(brgy_list_elem["risk"]) {
                        case "high":
                            poly_color = '#FF3333';
                            stroke_color = '#B30000';
                            var label_style = 'bg-danger';
                            break;
                        case "medium":
                            poly_color = '#E6E600';
                            stroke_color = '#FFFF33';
                            var label_style = 'bg-warning';
                            break;
                        default:
                            poly_color = '#33CC33';
                            stroke_color = '#196619';
                            var label_style = 'bg-success';
                    }

                    var brgy_polygon_elem = new google.maps.Polygon({
                        paths: brgy_list_elem["political_boundaries"],
                        strokeColor: stroke_color,
                        strokeOpacity: 1,
                        strokeWeight: 2,
                        fillColor: poly_color,  
                        zIndex: 2
                    });

                    brgy_polygon_elem.setMap(riskManagement.riskMap);
                    brgy_polygon_elem.set("poly_id", brgy_list_elem["elem_id"]);

                    // alert(riskManagement.brgyBoundariesList);
                    riskManagement.brgyBoundariesList.push(brgy_polygon_elem);
                    
                    google.maps.event.addListener(brgy_polygon_elem, 'click', (e) => {
                        var risk_to_upper_case = brgy_list_elem["risk"].charAt(0).toUpperCase() + brgy_list_elem["risk"].slice(1);
                        modal_contents = `
                            <div>
                                <div class="row">
                                    <div class="col-md-4 h6">Elevation</div>
                                    <div class="col-md-8">${brgy_list_elem["elevation"]} meters</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 h6">Risk Classification</div>
                                    <div class="col-md-8"><span class="badge ${label_style}">${risk_to_upper_case}</span></div>
                                </div>
                            </div>
                        `;

                        // alert(brgy_list_elem['barangay_id'])
                        // alert('================================')
                        console.log('test');
                        console.log(brgy_list_elem);
                        $("#modalTitle").html(brgy_list_elem['name'])
                        $("#barangayInfoModal .modal-body").html(modal_contents)
                        riskManagement.infoModal.show();
                    });
                    
                    
                });
            });
        },

        removeBoundaries: (marker_id) => {
            riskManagement.brgyBoundariesList.forEach( (elem_boundary)=>{
                elem_boundary.setMap(null);
            });
            riskManagement.brgyBoundariesList = [];
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
                let label_style = 'bg-primary';
                let overviewTargetElemId = null;

                // Loop througout the markers current row dataset
                markers_list_data.forEach( (marker_list_elem) => {

                    // choose marker appearance
                    switch(marker_storage_key_ref) {
                        case "evacuation_centers":
                            var icon_param = {
                                url: riskManagement.base_url + "/static/icons/gps_icon.png", // url
                                scaledSize: new google.maps.Size(35, 35), // scaled size
                                origin: new google.maps.Point(0,0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor
                            };
                            label_style = 'bg-danger';
                            marker_type_label = "Evacuation Center";
                            overviewTargetElemId = 'overviewTotalEvacuationCenters';
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
                            // console.log(marker_list_elem)
                            facility_icon = '';
                            overviewTargetElemId = 'overviewTotalFacilities';

                            switch(marker_list_elem["facility_type_id"]) {
                                case 1: // hospital
                                    facility_icon = 'hosp_icon.png';
                                    break;
                                case 2: // school
                                    facility_icon = 'educ_icon.png';
                                    break;
                                case 4: // airport
                                    facility_icon = 'airport_icon.png';
                                    break;
                                case 7: // barangay hall
                                    facility_icon = 'govt_icon.png';
                                    break;
                                default:
                                    facility_icon = 'house_pin.png';    
                            }

                            var icon_param = {
                                // url: riskManagement.base_url + "/static/icons/hospital.png",  // url
                                url: riskManagement.base_url + "/static/icons/" + facility_icon, // url
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
                        icon: (icon_param) ? icon_param : null
                    });
        
                    // set additional marker attributes
                    new_marker.set("id", marker_list_elem["id"])
                    new_marker.set("marker_id", marker_list_elem["marker_id"])
                    new_marker.setMap(riskManagement.riskMap);

                    // console.log("marker type id: " + marker_type_id);
                    // console.log("marker id:   " + marker_list_elem["id"]);
                    if ($('#'+overviewTargetElemId)) {
                        $('#'+overviewTargetElemId).text(markers_list_data.length);
                    }

                    // Create info window content
                    google.maps.InfoWindow.prototype.opened = false;
                    obj_map = riskManagement.riskMap;

                    obj_info_window = new google.maps.InfoWindow();

                    // set marker event
                    new_marker.addListener("click", ()=>{
                        let content_info_window_id = "content_window";

                        riskManagement.riskMap.panTo(new_marker.getPosition());

                        var str_info_window_contents =`
                        <div class="card-body">
                          <h5 class="card-title">${marker_list_elem['label']}</h5>
                          <h6 class="card-subtitle mb-2"><span class="badge ${label_style}">${marker_type_label}</span></h6>
                          <div class="card-text">
                              <div><b>Address:</b>&nbsp;${marker_list_elem["address"]}</div>
                              <div><b>Facility Type:</b>&nbsp;${marker_list_elem["facility_type_label"]}</div>
                              <div class="content-additional-attributes" id="infoContents"></div>
                          </div>
                        </div>
                        `;

                        obj_info_window.setContent(str_info_window_contents);

                        obj_info_window.open({
                            anchor: new_marker,
                            obj_map});

                        google.maps.event.addListener(obj_info_window, 'domready', function() {
                            if ('additional_attributes' in marker_list_elem) {
                                let additional_attr = marker_list_elem["additional_attributes"];
                                let status_active = (additional_attr["date_active_end"]) ? 'Not active' : 'Active';

                                console.log(additional_attr)

                                let additional_contents = `
                                    <div><b>Status:</b>&nbsp;&nbsp;<span class="badge rounded-pill bg-success">${status_active}</span></div>
                                    <div><b>Days Active:</b>&nbsp;${additional_attr["days_active"]}</div>
                                    <div><b>Activated on:</b>&nbsp;${additional_attr["date_active_start"]}</div>
                                `;
                                $('#infoContents').html(additional_contents);
                            } else {
                                $('#infoContents').html(null);
                            }
                        });
                    });

                    // push to marker storage list
                    riskManagement.markersList[marker_storage_key_ref].push(new_marker);
                });
            });
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

        loadInitMarkers: () => {
            // Loop througout the marker types
            for (const marker_type_key of Object.keys(riskManagement.markerTypes)) {
                // console.log(riskManagement.markerTypes[marker_type_key]);
                riskManagement.pullMarkersFromAPI(riskManagement.markerTypes[marker_type_key]);
            }
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

            // google.maps.event.addListenerOnce(riskManagement.riskMap, 'idle', function(){
            //     // do something only the first time the map is loaded
            //     // Load default map elements
            //     riskManagement.pullCityBoundaries();
            //     riskManagement.pullBarangayBoundaries();
            // });


        },

        init: () => {
            // load elements during init
            google.maps.event.addListenerOnce(riskManagement.riskMap, 'idle', function(){
                // do something only the first time the map is loaded
                riskManagement.pullBarangayBoundaries();
                riskManagement.loadInitMarkers();
                riskManagement.pullCityBoundaries();
            });

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

            $(".map-polygon-checkbox").on("click", (e) => {
                if ($(e.target).is(":checked")) {
                    riskManagement.pullBarangayBoundaries();
                } else {
                    riskManagement.removeBoundaries();
                }
            });
        
            $('#testButton').click(()=> {
                riskManagement.displayBarangayInfo();
            });
        },

        displayBarangayInfo: () => {
            riskManagement.infoModal.show();
        }
};


$(document).ready(function(){
    // rm = new riskManagement()
    // rm.init();
    riskManagement.init();
});