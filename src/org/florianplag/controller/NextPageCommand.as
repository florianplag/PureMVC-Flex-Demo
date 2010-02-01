package org.florianplag.controller {
	import org.florianplag.model.PageProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class NextPageCommand extends SimpleCommand {
		public function NextPageCommand() {
		}
	
		override public function execute(notification : INotification) : void {	
			var pageProxy:PageProxy = facade.retrieveProxy(PageProxy.NAME) as PageProxy;
			pageProxy.nextPage();
		}
	}
}
