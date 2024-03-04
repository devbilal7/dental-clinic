Rails.application.routes.draw do
  resources :sites
  resources :visit_route_masters
  resources :prosthodontic_masters
  resources :contract_types
  resources :occupation_masters
  resources :dh_aggregations
  resources :dentist_aggregations do 
    get 'monthly_tabulation', on: :collection 
    get 'annual_tabulation', on: :collection 
    get 'annual_tabulation_individual', on: :collection 
    get 'annual_tabulation_graph', on: :collection 
    get 'annual_individual_graph', on: :collection 
    get 'individual_graph', on: :collection 
  end 

  resources :pcourses
  resources :courses
  resources :treatment_coordinators, controller: "staff_infos", type: "TreatmentCoordinators"
  resources :staff_infos
  # mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :super_admins, path: 'super_admins', controllers: {
    sessions: 'super_admins/sessions',
    registrations: 'super_admins/registrations',
  }

  resources :dentist_hygienists, controller: "staff_infos", type: "DentistHygienists"
  resources :dentists, controller: "staff_infos", type: "Dentist"
  resources :agents 
  resources :managers
  resources :clinics
  resources :counselings do
    get 'batting_average', on: :collection 
    get 'consultant_list', on: :collection 
    get 'contract_list', on: :collection 
    get 'individual_consultant', on: :collection 
  end
  resources :oral_types
  get 'aggregation_basic_information',to: "counselings#aggregation_basic_information"
  get 'new_patient_progress',to: "visit_routes#new_patient_progress"
  get 'get_patient', to: "patients#get_patient"
  get 'new_patient_indi_progress',to: "visit_routes#new_patient_indi_progress"
  get 'individual_target',to: "counselings#individual_target"
  #-----------dh_aggregations-----------
  get 'dh_monthly_tabulation', to: "dh_aggregations#dh_monthly_tabulation"
  get 'dh_yearly_stats', to: "dh_aggregations#dh_yearly_stats"
  get 'dh_yearly_stats_doc', to: "dh_aggregations#dh_yearly_stats_doc"
  get 'dh_yearly_stats_graph', to: "dh_aggregations#dh_yearly_stats_graph"
  get 'dh_yearly_stats_doc_graph', to: "dh_aggregations#dh_yearly_stats_doc_graph"
  get 'dh_yearly_stats_cancel_graph', to: "dh_aggregations#dh_yearly_stats_cancel_graph"
  get 'dh_yearly_stats_doc_cancel_graph', to: "dh_aggregations#dh_yearly_stats_doc_cancel_graph"
  
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    masquerades:   'users/masquerades'
  }
  
  resources :patients do 
    get 'edit_patient', on: :collection
    put 'update_patient', on: :collection
    get 'appointment', on: :member 
    patch 'add_appointment', on: :collection

    get 'all_appointment', on: :collection
    post 'create_appointment', on: :collection

    get 'last_visit', on: :collection 
    post 'create_last_visit', on: :collection 
  end 
  
  get 'user/index'
  
  get 'homepage/home'
  #root 'homepage#home'
  root 'staff_infos#index'
  get 'translate',to: 'homepage#translate'

  resources :registrations  do 
    get 'clinic_edit', on: :member
    get 'admin_index', on: :collection 
    post 'create_admin', on: :collection 
    # patch 'clinic_update', on: :collection
    get 'admin_edit', on: :member 
    patch 'admin_update', on: :collection 
  end 
  get 'new_admin', to: "registrations#new_admin"
  patch 'clinic_update', to: "registrations#clinic_update"


  resources :visit_routes, except: [:destroy,:show]
  get "monthly_tabulation",to: "visit_routes#monthly_tabulation"

  resources :admin_managements do
    get 'system_management', on: :collection
    get 'document_management', on: :collection
    get 'client_management', on: :collection
    get 'master_admin', on: :collection
    post 'upload_version_control_document',on: :collection
    post 'upload_document', on: :collection
    delete 'destroy_document',on: :member
  end
end
