/*
 * This folder is used for setting up the test database. The test database is
 * used when you run `npm test`, for instance. When the docker container for the
 * test database starts, it adds all the files in this folder to the container,
 * files with an `.sql` extension are run only the first time the container
 * starts.
 */
create table cold_room_maintenance_logs_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_cold_room_maintenance_logs varchar,
	savepointTimestamp_cold_room_maintenance_logs varchar,
	actions_taken varchar,
	cold_room_id varchar,
	date_serviced varchar,
	other_maintenance_notes varchar,
	other_repair_notes varchar,
	other_spare_parts varchar,
	preventative_notes varchar,
	repair_notes varchar,
	serviced_by varchar,
	spare_parts varchar,
	technician_name varchar,
	technician_phone varchar,
	total_hrs_of_operation_unit1 varchar,
	total_hrs_of_operation_unit2 varchar,
	type_of_maintenance varchar,
	type_of_preventative_maintenance varchar,
	type_of_repair varchar,
	id_cold_room_maintenance_logs varchar
);

create table cold_rooms_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_cold_rooms varchar,
	savepointTimestamp_cold_rooms varchar,
	backup_generator varchar,
	backup_generator_functional_status varchar,
	dimensions varchar,
	facility_row_id varchar,
	functional_status varchar,
	gross_volume varchar,
	maintenance_priority varchar,
	manufacturer varchar,
	model varchar,
	net_volume varchar,
	notes varchar,
	reason_not_working varchar,
	serial_number varchar,
	storage_temperature varchar,
	temperature_monitoring_device varchar,
	temperature_monitoring_device_functional_status varchar,
	temperature_monitoring_device_type varchar,
	tracking_id varchar,
	type varchar,
	utilization varchar,
	year varchar,
	id_cold_rooms varchar
);

create table geographic_regions_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_geographic_regions varchar,
	savepointTimestamp_geographic_regions varchar,
	groupModify varchar,
	groupPrivileged varchar,
	groupReadOnly varchar,
	levelNumber varchar,
	location_accuracy varchar,
	location_altitude varchar,
	location_latitude varchar,
	location_longitude varchar,
	regionLevel1 varchar,
	regionLevel2 varchar,
	regionLevel3 varchar,
	regionLevel4 varchar,
	regionLevel5 varchar,
	regionName varchar,
	id_geographic_regions varchar(255)
);

create index geographic_regions_odkx_index
	on geographic_regions_odkx (id_geographic_regions);

create table health_facilities2_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_health_facilities varchar,
	savepointTimestamp_health_facilities varchar,
	location_accuracy varchar,
	location_altitude varchar,
	location_latitude varchar,
	location_longitude varchar,
	admin_region_id varchar(255),
	authority varchar,
	catchment_population varchar,
	cceGroupModify varchar,
	cceGroupPrivileged varchar,
	cceGroupReadOnly varchar,
	contact_name varchar,
	contact_phone_number varchar,
	contact_title varchar,
	distance_to_supply varchar,
	electricity_source varchar,
	facility_level varchar,
	facility_name varchar,
	facility_status varchar,
	fuel_availability varchar,
	grid_power_availability varchar,
	immunization_services_offered varchar,
	number_of_cold_boxes varchar,
	number_of_fs_cold_boxes varchar,
	number_of_fs_vaccine_carriers varchar,
	number_of_l3_packs varchar,
	number_of_l4_packs varchar,
	number_of_l6_packs varchar,
	number_of_vaccine_carriers varchar,
	ownership varchar,
	primary_facility_id varchar,
	secondary_facility_id varchar,
	spare_fuel_cylinders varchar,
	spare_temp_monitoring_devices varchar,
	vaccine_supply_interval varchar,
	vaccine_supply_mode varchar,
	id_health_facilities varchar(255)
);

create index health_facilities2_odkx_index
	on health_facilities2_odkx (id_health_facilities);

create index health_facilities2_odkx_region_index
	on health_facilities2_odkx (admin_region_id);

create table maintenance_logs_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_maintenance_logs varchar,
	savepointTimestamp_maintenance_logs varchar,
	actions_taken varchar,
	date_serviced varchar,
	other_maintenance_notes varchar,
	other_repair_notes varchar,
	other_spare_parts varchar,
	preventative_notes varchar,
	refrigerator_id varchar,
	repair_notes varchar,
	serviced_by varchar,
	spare_parts_electrical varchar,
	spare_parts_hardware varchar,
	spare_parts_monitoring varchar,
	spare_parts_power varchar,
	spare_parts_refrigeration varchar,
	spare_parts_solar varchar,
	technician_name varchar,
	technician_phone varchar,
	type_of_maintenance varchar,
	type_of_preventative_maintenance varchar,
	type_of_repair varchar,
	id_maintenance_logs varchar
);

create table refrigerator_moves_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_refrigerator_moves varchar,
	savepointTimestamp_refrigerator_moves varchar,
	move_date varchar,
	new_facility_id varchar,
	old_facility_id varchar,
	refrigerator_id varchar,
	id_refrigerator_moves varchar
);

create table refrigerator_temperature_data_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_refrigerator_temperature_data varchar,
	savepointTimestamp_refrigerator_temperature_data varchar,
	days_temp_above_8_30 varchar,
	days_temp_below_2_30 varchar,
	number_of_high_alarms_30 varchar,
	number_of_low_alarms_30 varchar,
	refrigerator_id varchar(255),
	reporting_period varchar,
    ft_serial_number varchar(255),
	id_refrigerator_temperature_data varchar(255)
);

create index refrigerator_temperature_data_odkx_index
	on refrigerator_temperature_data_odkx (id_refrigerator_temperature_data);

create index refrigerator_temperature_data_odkx_refrigerator_index
	on refrigerator_temperature_data_odkx (refrigerator_id);

create table refrigerator_types_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_refrigerator_types varchar,
	savepointTimestamp_refrigerator_types varchar,
	catalog_id varchar,
	climate_zone varchar,
	equipment_type varchar,
	freezer_gross_volume varchar,
	freezer_net_volume varchar,
	manufacturer varchar,
	model_id varchar,
	power_source varchar,
	refrigerator_gross_volume varchar,
	refrigerator_net_volume varchar,
	refrigerator_picture_contentType varchar,
	refrigerator_picture_uriFragment varchar,
	id_refrigerator_types varchar(255)
);

create index refrigerator_types_odkx_index
	on refrigerator_types_odkx (id_refrigerator_types);

create table refrigerators_odkx
(
	rowETag varchar,
	dataETagAtModification varchar,
	deleted varchar,
	createUser varchar,
	formId varchar,
	locale varchar,
	savepointType varchar,
	savepointCreator varchar,
	selfUri varchar,
	lastUpdateUser_refrigerators varchar,
	savepointTimestamp_refrigerators varchar,
	ehc_powered_devices varchar,
	facility_row_id varchar(255),
	functional_status varchar,
	maintenance_priority varchar,
	model_row_id varchar(255),
	notes varchar,
	power_source varchar,
	reason_not_working varchar,
	serial_number varchar,
	serial_number_image_contentType varchar,
	serial_number_image_uriFragment varchar,
	temperature_monitoring_device varchar,
	temperature_monitoring_device_functional_status varchar,
	temperature_monitoring_device_type varchar,
	tracking_id varchar,
	under_warranty varchar,
	utilization varchar,
	voltage_regulator varchar,
	voltage_regulator_functional_status varchar,
	voltage_regulator_serial_number varchar,
	warranty_service_provider_contact varchar,
	warranty_service_provider_name varchar,
	year_installed varchar,
	year_procured varchar,
	id_refrigerators varchar
);

create index refrigerators_odkx_facility_index
	on refrigerators_odkx (facility_row_id);

create index refrigerators_odkx_model_index
	on refrigerators_odkx (model_row_id);

create table ft_daily_temp_records_odkx
(
    rowETag varchar,
    dataETagAtModification varchar,
    deleted varchar,
    createUser varchar,
    formId varchar,
    locale varchar,
    savepointType varchar,
    savepointCreator varchar,
    selfUri varchar,
    lastUpdateUser_ft_daily_temp_records varchar,
    savepointTimestamp_ft_daily_temp_records varchar,
    android_sys_time varchar,
    avg_temp numeric,
    battery varchar,
    checked_time varchar,
    data_source varchar,
    date varchar,
    date_read varchar,
    ft_serial_number varchar,
    h_cond varchar,
    high_alarm varchar,
    high_duration numeric,
    high_trigger_time varchar,
    l_cond varchar,
    low_alarm varchar,
    low_duration numeric,
    low_trigger_time varchar,
    max_temp numeric,
    max_temp_time varchar,
    min_temp numeric,
    min_temp_time varchar,
    refrigerator_id varchar(255),
    units varchar,
    id_ft_daily_temp_records varchar(255)
);

create index ft_daily_temp_records_odkx_refrigerator_index
    on ft_daily_temp_records_odkx (refrigerator_id);
