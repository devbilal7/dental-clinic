class ChangeColumnsOfCounseling < ActiveRecord::Migration[7.0]
  def change
    change_column(:counselings, :first_visit, :date, using: "first_visit::date")
    change_column(:counselings, :re_first_visit, :date, using: "re_first_visit::date")
    change_column(:counselings, :second_visit, :date, using: "second_visit::date")
    change_column(:counselings, :p_consult, :date, using: "p_consult::date")
    change_column(:counselings, :inspection, :date, using: "inspection::date")
    change_column(:counselings, :treat_plan, :date, using: "treat_plan::date")
    change_column(:counselings, :prostho, :date, using: "prostho::date")
    change_column(:counselings, :denture, :date, using: "denture::date")
    change_column(:counselings, :whitening, :date, using: "whitening::date")
    change_column(:counselings, :implant, :date, using: "implant::date")
    change_column(:counselings, :invisalign, :date, using: "invisalign::date")
    change_column(:counselings, :other_correc, :date, using: "other_correc::date")
    change_column(:counselings, :micro, :date, using: "micro::date")
    change_column(:counselings, :maintainance, :date, using: "maintainance::date")
    change_column(:counselings, :main_resv_date, :date, using: "main_resv_date::date")
    change_column(:counselings, :cons_sign_date, :date, using: "cons_sign_date::date")
    
  end
end
