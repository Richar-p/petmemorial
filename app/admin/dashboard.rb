# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      h1 "Bienvenue administrateur de PetMemorial !"
      h2 "#{Pet.where(is_published: false).count} contribution(s) en attente de validation"
      h2 "Nombre de visites au total: #{Visitor.all.count}"
    end

    columns do
      column do
        table do
          thead do
            tr do
              th do
                "Statistiques de visiteurs aujourd'hui/heures"
              end
            end
          end
          tbody do
            tr do
              td { div line_chart Visitor.today.group_by_hour(:created_at).count }
            end
          end
        end
      end

      column do
        table do
          thead do
            tr do
              th do
                "Statistiques de visiteurs aujourd'hui/minutes"
              end
            end
          end
          tbody do
            tr do
              td { div line_chart Visitor.today.group_by_minute(:created_at).count }
            end
          end
        end
      end
    end

    columns do
      column id: "by_day" do
        table do
          thead do
            tr do
              th do
                "Statistiques de visiteurs totaux par jour"
              end
            end
          end
          tbody do
            tr do
              td { div line_chart Visitor.group_by_day(:created_at).count }
            end
          end
        end
      end

      column id: "by_week" do
        table do
          thead do
            tr do
              th do
                "Statistiques de visiteurs totaux par semaine"
              end
            end
          end
          tbody do
            tr do
              td { div line_chart Visitor.group_by_week(:created_at).count }
            end
          end
        end
      end

      column id: "by_month" do
        table do
          thead do
            tr do
              th do
                "Statistiques de visiteurs totaux par mois"
              end
            end
          end
          tbody do
            tr do
              td { div line_chart Visitor.group_by_month(:created_at).count }
            end
          end
        end
      end
    end
  end
end
