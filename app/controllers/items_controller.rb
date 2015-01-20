class ItemsController < ApplicationController
 
   def index
    @items = Item.all
    if !params[:search].blank?
    @items = Item.where(:item_name => params[:search])
    end
      @user = User.all
       respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
   def _panel
     
   end
  
  def home
    
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    
    @item = Item.find(params[:id])
   # @item.user_id==current_user.id
      
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
   
 end
 

 def like_count
  item = Item.find(params[:id])
  item.increment(:likes)
  item.save
  redirect_to :action=>'show' , :id=>item
end

 
  
  def list_recipe
    @list_recipe= params[:id]
    @category= Category.find(params[:id])
    @recipe= Item.where(:category_id => @list_recipe)
  end

  
  def _dashboard
    
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @item = Item.new
    if !current_user
     flash[:notice]="Please sign-in to add recipe !"
     redirect_to home_recipes_path
     return
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /categories/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id      
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


 


  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
