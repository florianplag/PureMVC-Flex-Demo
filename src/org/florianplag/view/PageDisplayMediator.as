package org.florianplag.view {
	import org.florianplag.model.PageProxy;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	import mx.containers.ViewStack;

	public class PageDisplayMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "PageDisplayMediator";
		
		public function PageDisplayMediator(viewComponent : ViewStack = null) {
			super(NAME, viewComponent);
		}


		override public function listNotificationInterests() : Array {
			return [PageProxy.PAGE_UPDATED];
		}

		
		override public function handleNotification(notification : INotification) : void {
			switch (notification.getName()) {
				case PageProxy.PAGE_UPDATED:
					updateDisplay(notification.getBody() as Number);	
			}
		}

		private function updateDisplay(pageNumber : Number) : void {
			// viewstack beginnt bei 0, seiten bei 1 (deshalb -1)
			pageDisplay.selectedIndex = (pageNumber - 1);
		}

		
		// Cast the viewComponent to its actual type. 
		protected function get pageDisplay() : ViewStack {
			return viewComponent as ViewStack;
		}		
		
	}
}
