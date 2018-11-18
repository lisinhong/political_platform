class PlaygroundsController < ApplicationController


    def index
        if current_user == nil 
            redirect_to "/users/auth/facebook"
            return
        end
        @user = User.new()
        @share_url = 'http://www.taiwanbunbun.com/result/' + current_user.try(:uid)

        render :template => "politicians/playground"
    end

    def upload
        @user = User.first
        u = @user.update(params[:image])

        if u
            render json: "oK"
        else
            render json: "No ok"
        end
    end

    def result

        @user_image_url = User.find_by(uid: params[:uid]).image.url       
        
        render :template => "politicians/result"
    end

    def get_second_step_questions

        query = Hash[params.permit([:'0',:'1',:'2',:'3',:'4',:'5']).to_h.sort_by{|k, v| v}.reverse]
        select_type = query.keys[0..2]

        @questions = Question.where(p_type: select_type).order(:p_type)


        render json: @questions

    end


    def get_result
        hashtags = params[:data]
        candidate_ids = []
        hashtags.each do |h|
            politician_ids = Hashtag.find(h).politics.pluck(:politician_id)
            candidate_ids =  candidate_ids + politician_ids
        end

        uniq_ids = candidate_ids.uniq
        result_id = 0
        result_count = 0
        uniq_ids.each do |u|
            candidate_count = candidate_ids.count(u)
            if candidate_count > result_count
                result_count = candidate_count
                result_id = u
            end
        end


        politician = Politician.find(result_id)
        politics = politician.politics
        type_ids = politics.pluck(:first_type)


        result = Result.new(name: current_user.try(:name), 
                    email: current_user.try(:email),   
                    u_id: current_user.try(:uid),
                    affairs: type_ids.count(0),
                    transportation: type_ids.count(1),
                    economic: type_ids.count(2),
                    education: type_ids.count(3),
                    teen: type_ids.count(4),
                    citizen: type_ids.count(5))
        result.save

        
        render json: [politician, politics, result]

    end

    private
    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/1/try.jpg", success_action_status: '201', acl: 'public-read')
    end

    def user_params
        params.require(:user).permit(:image)
    end

end