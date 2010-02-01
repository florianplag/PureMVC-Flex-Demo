package org.florianplag.view {
	import org.florianplag.model.PageProxy;
	import flash.events.MouseEvent;
	import org.florianplag.ApplicationFacade;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	import mx.controls.Button;

	public class PreviousPageButtonMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "PreviousPageButtonMediator";
		
		public function PreviousPageButtonMediator(viewComponent : Button = null) {
			super(NAME, viewComponent);
			
			previousPageButton.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(evt:MouseEvent) : void {
			sendNotification(ApplicationFacade.PREVIOUS_PAGE);
		}

		
		override public function listNotificationInterests() : Array {
			return [PageProxy.PAGE_UPDATED];
		}

		
		override public function handleNotification(notification : INotification) : void {
			switch (notification.getName()) {
				case PageProxy.PAGE_UPDATED:
					enableCheck(notification.getBody() as Number);	
			}
		}

		private function enableCheck(pageNumber:Number) : void {
			if (pageNumber == 1 ) {
				previousPageButton.enabled = false;
			} else {
				previousPageButton.enabled = true;
			}
		}

		// viewComponent casten
		protected function get previousPageButton() : Button {
			return viewComponent as Button;
		}		
		
	}
}
