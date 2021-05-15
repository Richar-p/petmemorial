# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      h1 "Bienvenue administrateur de PetMemorial !"
      h2 "#{Pet.where(is_published: false).count} contribution(s) en attente de validation"
      h2 "Nombre de visites au total: #{Visitor.all.count}"
    end

    table do
      thead do
        tr do
          th do
            "Statistiques de visiteurs"
          end
        end
      end
      tbody do
        tr do
          td do
            div line_chart Visitor.group_by_day(:created_at).count
          end
        end
      end
    end
  end
end
