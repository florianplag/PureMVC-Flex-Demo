package org.florianplag.view {
	import org.florianplag.ApplicationFacade;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;

	import mx.controls.Button;

	import flash.events.MouseEvent;

	public class JumpToPageButtonMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "JumpToPageButtonMediator";
		
		public function JumpToPageButtonMediator(viewComponent : Button = null) {
			super(NAME, viewComponent);
			
			jumpToPageButton.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(evt:MouseEvent) : void {
			sendNotification(ApplicationFacade.JUMP_TO_PAGE, 3);
		}

		
		// viewComponent casten 
		protected function get jumpToPageButton() : Button {
			return viewComponent as Button;
		}		
		
	}
}
