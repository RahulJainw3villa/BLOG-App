class BlogsController < ApplicationController
    
    def index
        @blogs = Blog.all
        @category = Category.all

        cate = params[:cate]

        if !cate.nil?
            @blogs = Blog.where(:category_id => cate)
        else
            @blog = Blog.all
        end
        
        # @blogs = Blog.all.order(title: :ASC)
        # @blogs = Blog.all.limit(8)
        # @blogs = Blog.all.order(title: :ASC).limit(5)
        @count = Blog.count
    end

   

    def new 
        @blog = Blog.new
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def create
        @blog = Blog.new(blog_params)
            if @blog.save
                redirect_to blogs_path, notice: 'Blog was successfully created'
            else
                render  :new, :status, :unprocessable_entity  
            end    
    end 

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        if @blog.destroy
                redirect_to root_path
            else
                redirect_to root_path, status: :see_other
            end
    end


    
    private
        def find_blog
            @blog = Blog.find(params[:id])
        end

        def blog_params
            params.require(:blog).permit(:title, :description, :category_id,:image)
        end


end
