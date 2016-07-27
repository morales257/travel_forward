class DynamicRouter
  def self.load
    return unless ActiveRecord::Base.connection.table_exists? 'pages'
    Rails.application.routes.draw do
     Page.all.each do |pg|
        puts "Routing #{pg.name}"
        #match the country path TO the show action in the Pages controller
        #and set the params[:id] by default
        get "/#{pg.name}", :to => "pages#show", defaults: { id: pg.id}
    end
    end
  end
end
