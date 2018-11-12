class PlaygroundsController < ApplicationController


    def index

        render :template => "politicians/playground"
    end

    def render_result

        render :template => "politicians/playground"
    end

    def get_second_step_questions

        puts @params
        query = Hash[params.permit([:'0',:'1',:'2',:'3',:'4',:'5']).to_h.sort_by{|k, v| v}.reverse]
        select_type = query.keys[0..2]

        puts query
        @questions = Question.where(p_type: select_type).order(:p_type)


        render json: @questions

    end

    private
    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/1/try.jpg", success_action_status: '201', acl: 'public-read')
    end

end