class PlaygroundsController < ApplicationController


    def index
        if !params[:admin].present?
            if current_user == nil 
                redirect_to "/users/auth/facebook"
                return
            end
            @share_url = 'https://www.taiwanbunbun.com/result/' + current_user.try(:uid)
        end

        @user = User.new()
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
        @user = User.find_by(uid: params[:uid])   
        @result = Result.all.where(u_id: params[:uid]).last
        @politician = Politician.find(@result.politician_id)
        render :template => "politicians/result"
    end

    def get_second_step_questions

        query = Hash[params.permit([:'0',:'1',:'2',:'3',:'4',:'5']).to_h.sort_by{|k, v| v}.reverse]
        select_type = query.keys[0..2].shuffle
        puts query
        questions1 = Question.where(p_type: select_type[0]).order("p_type, id")
        questions2 = Question.where(p_type: select_type[1]).order("p_type, id")
        questions3 = Question.where(p_type: select_type[2]).order("p_type, id")
        @questions = questions1 + questions2 + questions3

        result = Result.new(name: current_user.try(:name), 
        email: current_user.try(:email),   
        u_id: current_user.try(:uid),
        affairs: query["0"],
        transportation: query["1"],
        economic: query["2"],
        education: query["3"],
        teen: query["4"],
        citizen: query["5"])
        result.save


        render json: @questions

    end


    def get_result
        hashtags = params[:data]
        candidate_ids = []
        type_ids = []
        hashtags.each do |h|
            politician_ids = Hashtag.find(h).politics.pluck(:politician_id)
            candidate_ids =  candidate_ids + politician_ids
            type_ids.push(Hashtag.find(h).politic_type_id)
        end

        uniq_ids = candidate_ids.uniq
        result_id = []
        candidate_counts = []
        uniq_ids.each do |u|
            candidate_count = candidate_ids.count(u)
            candidate_counts.push(candidate_count)
        end

        result_count = candidate_counts.sort.last(10).min
        uniq_ids.each do |u|
            candidate_count = candidate_ids.count(u)
            if candidate_count >= result_count
                result_id.push(u)
            end
        end


        politician = Politician.where(id: result_id).order("RANDOM()").first
        politics = politician.politics.order(:id)
     


        result = Result.where(u_id: current_user.try(:uid)).last
        result.politician_id = politician.id
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