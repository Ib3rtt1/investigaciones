# inicio del proyecto
  rails new investigaciones -d postgresql
  <div id="configuracion de database.yml">
    adapter: postgresql
    encoding: unicode
    database: bd_Investigaciones
    username: postgres
    password: p3t1t
    host: localhost
    port: 5432
  </div>
  <"si falta postgres bundle add pg ">
  rails db:create
  git hub: 🎉inicio de proyecto

# bootstrap con CDN
  en layouts\aplication.html.erb
  <%= stylesheet_link_tag 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' %>
  Agrega el enlace al archivo JavaScript de Bootstrap en el mismo archivo, justo antes del cierre del body
  <%= javascript_include_tag 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js' %>

# CRUD
  rails db:rollback para revertir las migraciones 

# helpers y comandos 
  <img src="<%= image_path('nombre_de_la_imagen.jpg') %>" alt="Texto alternativo" class="imagen-destacada" width="200" height="150">

# devise
  bundle add devise
  bundle install
  rails generate devise:install
  config/environments/development.rb:
  en linea 40 de config/environments/development.rb agregar  
    config.action_mailer.default_url_options =   {host: 'localhost', port: 3000 }
  rails generate devise User
  rails db:migrate
  git : ♦️ se agrega modelo user con devise 
  rails generate controller Home index
  en config/routes.rb agregar=> root  "home#index"
  en aplication.html.erb se agrega 
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
  crear shared navbar 
  renderizar <%= render 'shared/navbar' %>
  rails s
  git 🏡 home controller
# detalles vistas
  rails g migration AddDetailsToUsers name 
  rails db:migrate
  <Agregamos campos nuevos a strong_params de Devise>
  rails generate devise:controllers users
  en config/routes.rb agregar:
        devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }
  en #app/controllers/users/registrations_controller.rb descomentamos las primeras lineas 4  y 5 
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
  <div id="#app/controllers/users/registrations_controller.rb">
    en  Descomentamos y editamos métodos protegidos
    # protected y agregamos los atributos 
  </div>

  <div id="#app/controllers/application_controller.rb">
    Modificamos application_controller
    class ApplicationController < ActionController::Base
          before_action :configure_permitted_parameters, if: :devise_controller?
          protected
          def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, ])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, ])
          end
          def after_sign_in_path_for(resource)
            posts_path  donde quieres enviarlo depues de registrarse
          end
        end
  </div> 

  <div id="#app/views/shared/_navbar.html.erb ">
     en agregamos
        <% if user_signed_in? %>
          <% if current_user.name %>
            Hola <%= current_user.name %>
          <% else %>
            Hola <%= current_user.email %>
          <% end %>
        <% else %>
          Dale registrate o conectate
        <% end %>  
        <ul class="dropdown-menu">
          <% if user_signed_in? %>
          <li><%= button_to 'Cerrar sesión', destroy_user_session_path, class: 'dropdown-item', method: :delete %></li>
          <% else %>
          <li><%= link_to 'Iniciar sesión', new_user_session_path, class: 'dropdown-item'%></li>
          <li><hr class="dropdown-divider"></li>
          <li><%= link_to 'Registro', new_user_registration_path, class: 'dropdown-item'%></li>
          <% end %>
        </ul> 
        <a class="nav-link dropdown-toggle" href="#" role="button"
          data-bs-toggle="dropdown" aria-expanded="false">
          <% if user_signed_in? %>
          Hola <%= current_user.email %>
          <% else %>
          Dale registrate o conectate
          <% end %>
        </a>
  </div> 
  
  git 🥳 usuario con autenticacion
<div id= "insertar imagenes"> 
</div >

# modelo
  <div id="modelo investigador 1 a N">
    rails generate scaffold Investigador nombre:string
    rails db:migrate
    Agregamos migración para relacionar modelos.
      rails g migration AddUsersToInvestigador user:references
    #app/models/user.rb
      has_many :investigador
    #app/models/investigador.rb
      belongs_to :user
    <app/models/investigacion.rb>
      class Investigacion < ApplicationRecord
        has_and_belongs_to_many :investigadores
      end
    <app/models/investigador.rb>
    class Investigador < ApplicationRecord
      has_and_belongs_to_many :investigaciones
    end
    <div id="union de modelos">
      rails generate migration CreateInvestigacionesInvestigadores investigacion:references investigador:references
      rails db:migrate
      <app/models/investigaciones_investigadores.rb>
      class InvestigacionesInvestigadores < ApplicationRecord
        belongs_to :investigacion
        belongs_to :investigador
      end
   </div>
  </div>

  <div id="modelo Investigacion na n y 1 a N">
    rails generate scaffold Investigacion name:string date:integer title:string resume:text
    rails db:migrate
  </div>
      
  <div id="app/controllers/investigacion_controller.rb Agregamos asociación al momento de crear al usuario">
      def create
        @investigacion = Investigacion.new(investigacion_params)
        @investigacion.user = current_user # Asegúrate de que current_user esté configurado correctamente
        respond_to do |format|
        if @investigacion.save
          format.html { redirect_to investigacion_url(@investigacion), notice: "Investigacion was successfully created." }
          format.json { render :show, status: :created, location: @investigacion }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @investigacion.errors, status: :unprocessable_entity }
        end
      end
    end
    private
    def investigacion_params
      params.require(:investigacion).permit(:name, :date, :title, :resume, :date)
    end
  </div>
   
  <div id="Dejaremos que no sea necesario conectarse para ver la investigacion"> 
    #app/controllers/investigacion_controller.rb
      before_action :authenticate_user!, except: [:index, :show]
    Solo el dueño del blog debe ser capaz de editar y borrar.
    Deshabilitamos la vista de los botones de borrar y editar si el usuario no es el dueño
    <div id="app/views/investigacion/show.html.erb">
      <%= link_to "Back to ()", ()_path %>
      <% if user_signed_in? %>
      <% if current_user.id == @().user_id %>
      <%= link_to "Edit this ()", edit_()_path(@()) %> |
      <%= button_to "Destroy this ()", @(), method: :delete %>
      <% end %>
      <% end %>
    </div>
    Al ingresar un usuario debe ser redirigido hacia la vista index de ()
    Agregamos navegación por el navbar para el usuario.
  </div>
  
  <div id="modelo publicacion 1 a N">
    rails generate scaffold publicacion  name:string date:integer title:string resume:text
    rails db:migrate

  </div>

  <div id="comentario  ">
   
  </div>
  <div id="reacciones ">
     rails g model Reaction kind publicaciones:references user:references

  </div>

# claves y pruebas unitarias

# recuperar contraseña

# usuarios y accesos
  <roles> 

# faker

# borrado en cascada

# anidando recursos 

# pruebas unitarias

# active storage

# S3

# capibara 

# cancancan

# figaro

# pagy

# eliminar actualizar agregar 

# bootstrap con gemas 
  <div>yarn (gestor de dependencias JS ) 
    yarn add @hotwired/turbo-rails
    yarn add @hotwired/stimulus
    bundle add esbuild-rails
      rails esbuild:install
    gema cssbundling-rails https://github.com/rails/cssbundling-rails
      bundle add cssbundling-rails
      rails css:install:bootstrap
    gema jsbundling-rails https://github.com/rails/jsbundling-rails  
      bundle add jsbundling-rails
      rails javascript:install:esbuild
    Ajustaremos el path de  app/javascript/application.js y cambiaremos las llamadas antiguas de ‘stimulus’ en 
  </div>
    <div id="app/javascript/controllers/index.js">
      import "./controllers"
      import * as bootstrap from "bootstrap"
  </div>

  <div id="app/javascript/controllers/index.js">
      // Import and register all your controllers from the importmap under controllers/*
      // import { application } from "controllers/application"
      // Eager load all controllers defined in the import map under controllers/**/*_controller
      // import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
      // eagerLoadControllersFrom("controllers", application)
      // Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
      // import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
      // lazyLoadControllersFrom("controllers", application) 
      import { application } from "./application";
  </div>

    app/views/layouts/application.html.erb sacamos ‘javascript_importmap_tags y agregamos
    <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>
    app/assets/config/manifest.js  solo dejaremos ‘builds’ e ‘images’. 
    rails javascript:install:esbuild
    yarn add @hotwired/turbo-rails
    yarn add @hotwired/stimulus
    agregar //= link application.js en app>assets>config>manifest.js
    git comit: 🎨 se agrega bootstrap
