class Admin::RubiesController < ApplicationController
  layout 'admin'

  # GET /admin/rubies
  # GET /admin/rubies.json
  def index
    @rubies = Ruby.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rubies }
    end
  end

  # GET /admin/rubies/1
  # GET /admin/rubies/1.json
  def show
    @ruby = Ruby.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ruby }
    end
  end

  # GET /admin/rubies/new
  # GET /admin/rubies/new.json
  def new
    @ruby = Ruby.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ruby }
    end
  end

  # GET /admin/rubies/1/edit
  def edit
    @ruby = Ruby.find(params[:id])
  end

  # POST /admin/rubies
  # POST /admin/rubies.json
  def create
    @ruby = Ruby.new(params[:ruby])

    respond_to do |format|
      if @ruby.save
        format.html { redirect_to admin_rubies_path, notice: 'Ruby was successfully created.' }
        format.json { render json: @ruby, status: :created, location: @ruby }
      else
        format.html { render action: "new" }
        format.json { render json: @ruby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/rubies/1
  # PUT /admin/rubies/1.json
  def update
    @ruby = Ruby.find(params[:id])

    respond_to do |format|
      if @ruby.update_attributes(params[:ruby])
        format.html { redirect_to admin_ruby_path(@ruby), notice: 'Ruby was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ruby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/rubies/1
  # DELETE /admin/rubies/1.json
  def destroy
    @ruby = Ruby.find(params[:id])
    @ruby.destroy

    respond_to do |format|
      format.html { redirect_to admin_rubies_url }
      format.json { head :no_content }
    end
  end
end
