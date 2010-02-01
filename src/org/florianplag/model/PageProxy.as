package org.florianplag.model {
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class PageProxy extends Proxy implements IProxy {
		
		public static const NAME:String = "pageProxy";
		
		private var _currentPage:Number = 1;
		private var _maxPageNumber:Number = 4;
	
		public static const PAGE_UPDATED:String = NAME + ".updated";
		
		public function PageProxy() {
			super(NAME);					
		}

		
		public function nextPage():void {
			_currentPage += 1;
			sendNotification(PAGE_UPDATED, _currentPage);
		}

		public function previousPage():void {
			_currentPage -= 1;
			sendNotification(PAGE_UPDATED, _currentPage);	
		}
		
		public function jumpToPage(pageNumber:Number):void {
			if ( (pageNumber > 0) && (pageNumber <= maxPageNumber)  ) {
				_currentPage = pageNumber;
				sendNotification(PAGE_UPDATED, _currentPage);
			}
		}
		
		public function get maxPageNumber() : Number {
			return _maxPageNumber;
		}		
	}
}
