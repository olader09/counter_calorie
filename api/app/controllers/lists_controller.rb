class ListsController < ApplicationController
  authorize_resource
  before_action :auth_user, :load_list

  def show
    render json: render_list
  end

  def add
    product = Product.find(params[:product_id])
    product_val_cal = (product.proteins * product.fats * product.carbohydrates)
    if @list.products.include?(product)
      lists_product = @list.lists_products.find_by(product: product)
      lists_product.quantity += 1
      lists_product.save
    else
      @list.products << product
    end
    @list.update(value_cal: @list.value_cal + product_val_cal)
    render json: render_list
  end

  def remove
    product = Product.find(params[:product_id])
    product_val_cal = (product.proteins * product.fats * product.carbohydrates)
    if @list.products.include?(product)
      lists_product = @list.lists_products.find_by(product: product)
      if lists_product.quantity > 1
        lists_product.quantity -= 1 
        lists_product.save
      else
        @list.products.delete(product)
      end
    else
      render json: {error: "Этого продукта нет в корзине."}, status: :bad_request
      return
    end
    @list.value_cal -= product_val_cal
    @list.save
    render json: render_list
  end

  def destroy
    product = Product.find(params[:product_id])
    product_val_cal = (product.proteins * product.fats * product.carbohydrates)
    if @list.products.include?(product)
      lists_product = @list.lists_products.find_by(product: product)
      @list.products.delete(product)
    else
      render json: {error: "Этого продукта нет в списке."}, status: :bad_request
      return
    end
    @list.value_cal -= product_val_cal * lists_product.quantity
    @list.save
    render json: render_list
  end


  protected
  def load_list
    @list = current_user.list
  end

  def render_list
    @list.to_json(include: { 
                      lists_products: { only: %i[quantity],
                        include:{
                          product:{}
                        }},
                    })  
  end
  
end
