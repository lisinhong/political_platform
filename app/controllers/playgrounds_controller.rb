class PlaygroundsController < ApplicationController


    def index

        render :template => "politicians/playground"
    end

    def render_result

        render :template => "politicians/playground"
    end

    def get_second_step_questions
        query = Hash[params[:q].sort_by{|k, v| v}.reverse]
        select_type = query.keys[0..2]
        @questions = Question.where(p_type: select_type).order(:p_type)


        render json: @questions

    end

    private
    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/1/try.jpg", success_action_status: '201', acl: 'public-read')
    end

end