package m.mvc.api;

import m.mvc.api.IViewContainer;

/**
The Robotlegs MediatorMap contract
*/
interface IMediatorMap
{
	
	/**
	 * Map an <code>IMediator</code> to a view Class
	 *
	 * @param viewClassOrName The concrete view Class or Fully Qualified Class Name
	 * @param mediatorClass The <code>IMediator</code> Class
	 * @param injectViewAs The explicit view Interface or Class that the mediator depends on OR an Array of such Interfaces/Classes.
	 * @param autoCreate Automatically construct and register an instance of Class <code>mediatorClass</code> when an instance of Class <code>viewClass</code> is detected
	 * @param autoRemove Automatically remove an instance of Class <code>mediatorClass</code> when its <code>viewClass</code> leaves the ancestory of the context view
	 */
	function mapView(viewClassOrName:Dynamic, mediatorClass:Class<Dynamic>, ?injectViewAs:Dynamic = null, ?autoCreate:Bool = true, ?autoRemove:Bool = true):Void;
	
	/**
	 * Unmap a view Class
	 *  
	 * @param viewClassOrName The concrete view Class or Fully Qualified Class Name
	 */		
	function unmapView(viewClassOrName:Dynamic):Void;
	
	/**
	 * Create an instance of a mapped <code>IMediator</code>
	 *
	 * <p>This will instantiate and register a Mediator for a given View Component.
	 * Mediator dependencies will be automatically resolved.</p>
	 *
	 * @param viewComponent An instance of the view Class previously mapped to an <code>IMediator</code> Class
	 * @return The <code>IMediator</code>
	 */
	function createMediator(viewComponent:Dynamic):IMediator;
	
	/**
	 * Manually register an <code>IMediator</code> instance
	 *
	 * <p>NOTE: Registering a Mediator will NOT inject its dependencies.
	 * It is assumed that dependencies are already satisfied.</p>
	 *
	 * @param viewComponent The view component for the <code>IMediator</code>
	 * @param mediator The <code>IMediator</code> to register
	 */
	function registerMediator(viewComponent:Dynamic, mediator:IMediator):Void;
	
	/**
	 * Remove a registered <code>IMediator</code> instance
	 *
	 * @param mediator The <code>IMediator</code> to remove
	 * @return The <code>IMediator</code> that was removed
	 */
	function removeMediator(mediator:IMediator):IMediator;
	
	/**
	 * Remove a registered <code>IMediator</code> instance
	 *
	 * @param viewComponent The view that the <code>IMediator</code> was registered with
	 * @return The <code>IMediator</code> that was removed
	 */
	function removeMediatorByView(viewComponent:Dynamic):IMediator;
	
	/**
	 * Retrieve a registered <code>IMediator</code> instance
	 *
	 * @param viewComponent The view that the <code>IMediator</code> was registered with
	 * @return The <code>IMediator</code>
	 */
	function retrieveMediator(viewComponent:Dynamic):IMediator;
	
	/**
	 * Check if the view Class has been mapped or not
	 * 
	 * @param viewClassOrName The concrete view Class or Fully Qualified Class Name
	 * 
	 * @return Whether this view class has been mapped
	 */
	function hasMapping(viewClassOrName:Dynamic):Bool;
	
	/**
	 * Check if the <code>IMediator</code> has been registered
	 *
	 * @param mediator The <code>IMediator</code> instance
	 * @return Whether this <code>IMediator</code> has been registered
	 */
	function hasMediator(mediator:IMediator):Bool;
	
	/**
	 * Check if an <code>IMediator</code> has been registered for a view instance
	 *
	 * @param viewComponent The view that the <code>IMediator</code> was registered with
	 * @return Whether an <code>IMediator</code> has been registered for this view instance
	 */
	function hasMediatorForView(viewComponent:Dynamic):Bool;
	
	/**
	 * The <code>IMediatorMap</code>'s <code>IViewContainer</code>
	 *
	 * @return view The <code>IViewContainer</code> to use as scope for this <code>IMediatorMap</code>
	 */
	var contextView(default, set_contextView):IViewContainer;
	
	/**
	 * The <code>IMediatorMap</code>'s enabled status
	 * 
	 * @return Whether the <code>IMediatorMap</code> is enabled
	 */		
	var enabled(default, set_enabled):Bool;
}
