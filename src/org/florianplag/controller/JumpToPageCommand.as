package org.florianplag.controller {
	import org.florianplag.model.PageProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class JumpToPageCommand extends SimpleCommand {
		public function JumpToPageCommand() {
		}

		override public function execute(notification : INotification) : void {	
			var pageProxy:PageProxy = facade.retrieveProxy(PageProxy.NAME) as PageProxy;
			pageProxy.jumpToPage(notification.getBody() as Number);
		}
	}
}
