# Evacuation Center Tracker

This application will help track the evacuation centers in Cauayan city under the Sparta Project Hackathon endeavor using Python 3.10.6, Google Maps API and Javascript (ES6 and jQuery).

## Installation

1. Generate the [Google Map API Key](https://developers.google.com/maps/documentation/javascript/get-api-key)
2. Create the venv folder using 
```bash 
python3 -m venv venv
```
3. Activate the virtual environment
```bash 
souce venv/bin/activate
```
4. Install the python packages under the requirements.txt. Use the package manager [pip](https://pip.pypa.io/en/stable/).
```bash 
python3 -m pip install -r requirements.txt
```
5. Import the database backup using any DB GUI editor or command line. File location is under client_prototype/risk_centers_map/data_source_files/dump-db_risk_management-202210301815.sql
6. Adjust the db configuration in django which is located on client_prototype/client_prototype/settings.py
7. Adjust the GOOGLE_MAPS_API_KEY by replacing it with the value from step 1 (Generate the Google Map API Key). The target file is client_prototype/client_prototype/settings.py
8. Replace the riskManagement.base_url value with your base url root (client_prototype/risk_centers_map/static/js/custom.js)
9. Go to the client_prototype folder and run the application (reference: [Django Tutorial](https://docs.djangoproject.com/en/4.1/intro/tutorial01/)) using the command:
```bash
python3 manage.py runserver
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)