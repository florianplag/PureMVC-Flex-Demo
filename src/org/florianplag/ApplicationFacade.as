package org.florianplag {
	import org.florianplag.controller.JumpToPageCommand;
	import org.florianplag.controller.PreviousPageCommand;
	import org.florianplag.controller.NextPageCommand;
	import org.florianplag.controller.StartupCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	/**
	 * @author flo
	 */
	public class ApplicationFacade extends Facade implements IFacade {
		
		public static const STARTUP:String = "startup";
		public static const NEXT_PAGE:String = "nextPage";
		public static const PREVIOUS_PAGE:String = "previousPage";
		public static const JUMP_TO_PAGE:String = "jumpToPage";
		
		public function ApplicationFacade() {
			super();
		}
		
		/*
		 * Singleton für ApplicationFacade
		 */
		public static function getInstance() : ApplicationFacade {
            if ( instance == null ) instance = new ApplicationFacade();
            return instance as ApplicationFacade;
        }
        
        /*
         * Commands registrieren
         */
        override protected function initializeController():void {
        	super.initializeController();
        	
        	registerCommand(STARTUP, StartupCommand );  
        	registerCommand(NEXT_PAGE, NextPageCommand);       	        	        	
        	registerCommand(PREVIOUS_PAGE, PreviousPageCommand);    
        	registerCommand(JUMP_TO_PAGE, JumpToPageCommand);   	        	        	
        }
        
		
	}
}
