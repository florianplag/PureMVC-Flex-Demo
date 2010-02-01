package org.florianplag.controller {
	import org.florianplag.model.PageProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class PreviousPageCommand extends SimpleCommand implements ICommand {
		public function PreviousPageCommand() {
		}

		
		override public function execute(notification : INotification) : void {
			var pageProxy:PageProxy = facade.retrieveProxy(PageProxy.NAME) as PageProxy;
			pageProxy.previousPage();			
		}
	}
}
