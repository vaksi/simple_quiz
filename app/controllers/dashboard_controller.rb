class DashboardController < ApplicationController
    def balancer
        if is_teacher? 
            redirect_to "teacher/dashboard" 
        end

        if is_student?
            redirect_to "student/dashboard" 
        end
    end
end
