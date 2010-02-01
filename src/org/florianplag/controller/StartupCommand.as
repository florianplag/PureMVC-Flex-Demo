package org.florianplag.controller {
	import org.florianplag.model.PageProxy;
	import org.florianplag.view.JumpToPageButtonMediator;
	import org.florianplag.view.NextPageButtonMediator;
	import org.florianplag.view.PageDisplayMediator;
	import org.florianplag.view.PreviousPageButtonMediator;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	/**
	 * @author flo
	 */
	public class StartupCommand extends SimpleCommand implements ICommand {
		public function StartupCommand() {
		}

		
		override public function execute(notification : INotification) : void {
			
			// reference zur Hauptklasse (Main) aus der Notification auslesen
			var main:Main = notification.getBody() as Main;
			
			// Mediatoren registrieren
			facade.registerMediator(new NextPageButtonMediator(main.nextPageButton));
			facade.registerMediator(new PreviousPageButtonMediator(main.previousPageButton));
			facade.registerMediator(new JumpToPageButtonMediator(main.jumpToPageButton));
			facade.registerMediator(new PageDisplayMediator(main.customView.pageDisplay));
			
			// neues Model anlegen
			facade.registerProxy(new PageProxy());
			
			// obiges Model auslesen und mit 1. Seite initialisieren
			var pageProxy:PageProxy = facade.retrieveProxy(PageProxy.NAME) as PageProxy;			
			pageProxy.jumpToPage(1);			
		}
	}
}
