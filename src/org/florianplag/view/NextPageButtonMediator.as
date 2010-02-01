package org.florianplag.view {
	import org.florianplag.model.PageProxy;
	import flash.events.MouseEvent;
	import org.florianplag.ApplicationFacade;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	import mx.controls.Button;


	public class NextPageButtonMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "NextPageButtonMediator";
		
		public function NextPageButtonMediator(viewComponent : Button = null) {
			super(NAME, viewComponent);
			
			nextPageButton.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onClick(evt:MouseEvent) : void {
			sendNotification(ApplicationFacade.NEXT_PAGE);
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

			var pageProxy:PageProxy = facade.retrieveProxy(PageProxy.NAME) as PageProxy;
			if (pageNumber == pageProxy.maxPageNumber) {
				nextPageButton.enabled = false;
			} else {
				nextPageButton.enabled = true;
			}
		}

		// viewComponent casten
		protected function get nextPageButton() : Button {
			return viewComponent as Button;
		}		
		
	}
}
