ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      h1 "Bienvenue administrateur de PetMemorial !"
      h2 "#{Pet.where(is_published: false).count} contribution(s) en attente de validation"
    end
  end
end
