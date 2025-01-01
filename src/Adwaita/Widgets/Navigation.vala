namespace Vui.Widget {
    protected delegate void NavigationCallback (Adw.NavigationView nav);
    protected delegate void pass (GLib.Variant? variant);

    public struct Navigation : Vui.Impl.Wrap<Adw.NavigationView, Navigation> {

        public Navigation bind (NavigationCallback handle){
            handle(this._widget);
            return this;
        }

        public Navigation on_pushed (NavigationCallback handle){
            _widget.pushed.connect(handle);
            return this;
        }

  //       public Navigation add_action (string action_name, owned NavigationCallback handle) {
		// 	var new_action = new SimpleAction("nav." + action_name, null);
		// 	new_action.activate.connect_after (zap);

		// 	simple_action_group.add_action(new_action);
		// 	return this;
		// }

        public Navigation push_later (Vui.Widget.Page[] children) {
            foreach (var item in children){
                _widget.add (item._widget);
                print("page %s added\n", item._widget.tag);
            }
            return this;
        }

        public Navigation (Vui.Widget.Page[] children) {
            widget = new Adw.NavigationView ();
            foreach (var item in children){
                _widget.push (item._widget);
                _widget.add (item._widget);
                print("page %s added\n", item._widget.tag);
            }
        }
    }
}
