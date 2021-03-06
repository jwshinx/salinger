class NotesController < ApplicationController
  layout 'note'
  load_and_authorize_resource
  include Trackable
  
  def index
    #@notes = Note.all
    @notes = Note.order('created_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  def show
    #@note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def new
    #@note = Note.new
    #@note_owner = Customer.find params[:notable_id]
    if EvalSmetto.new(params[:notable_type]).is_evalable?
     @note_owner = eval "#{params[:notable_type]}.find(#{params[:notable_id]})"
    else
     raise Exception
    end
    @type_of_note = params[:type]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  rescue Exception => exc
    logger.error "---> maybe eval-smetto failed: #{exc}"
    flash[:notice] = "An error occured. Take a printscreen and email Joel."
    redirect_to notes_url
  end

  def edit
    #@note = Note.find(params[:id])
  end

  def create
    set_creator_and_updater @note, current_user    

    respond_to do |format|
      if @note.save
        #format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.html { redirect_to note_url(@note), notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@note = Note.find(params[:id])
    @note.updater = current_user
    hash = (params[:fyi].nil?) ? params[:todo] : params[:fyi]

    respond_to do |format|
      #if @note.update_attributes(params[:note])
      if @note.update_attributes(hash)
        format.html { redirect_to note_url(@note), notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end
end
