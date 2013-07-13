class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :read, :all
      can :create, :all

      can :update, Product 
      can :destroy, Product 
      can :update, Fabric 
      can :destroy, Fabric 
      can :update, Customer 
      can :destroy, Customer 
      can :update, Note 
      can :destroy, Note 
      can :update, Farm 
      can :destroy, Farm 
      can :update, Retailer 
      can :destroy, Retailer 
      can :update, Address 
      can :destroy, Address 
      can :update, Order 
      can :destroy, Order 
      can :update, OrderLineItem
      can :destroy, OrderLineItem 
      #can :update, Task
      #can :destroy, Task
      can :manage, Task
      can :update, TaskStatusType 
      can :destroy, TaskStatusType 
      can :update, CustomerAddress
      can :destroy, CustomerAddress
      can :update, AddressType 
      can :destroy, AddressType
      can :update, FabricPrice 
      can :destroy, FabricPrice 
      can :update, Version 
      can :destroy, Version                               

      cannot :create, Role
      cannot :destroy, Role
      cannot :create, EmailType 
      cannot :destroy, EmailType 

      cannot :read, User
      can :read, User, :id => user.id
      cannot :create, User 
      can :update, User, :id => user.id

      can :update, OrderStatus 
      cannot :destroy, OrderStatus 

    else
     #cannot :destroy, Email #update and #read
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
