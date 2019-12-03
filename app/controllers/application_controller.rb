class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    # include ActionController::MimeResponds
    # include Response
    # include ExceptionHandler    

end
