namespace Vui.Widget {
    public class Navigation : Vui.Impl.Generic<Navigation, Adw.NavigationView> {
        protected delegate void Action (Navigation nav);

        public Navigation bind (Action handle){
            handle(this);
            return this;
        }

        public Navigation on_pushed (owned Action handle){
            this.widget.pushed.connect (() => {
                handle(this);
            });
            return this;
        }

        public Navigation add_action (string action_name, Action handle) {
            var new_action = new SimpleAction("nav." + action_name, null);
            new_action.activate.connect(() => handle(this));

            simple_action_group.add_action(new_action);
            return this;
        }

        public Navigation push_later (params Vui.Widget.Page[] c) {
            foreach (var item in c){
                widget.add (item.widget);
                print("page %s added\n", item.widget.tag);
            }
            return this;
        }

        public Navigation (params Vui.Widget.Page[] c) {
            widget = new Adw.NavigationView ();
            foreach (var item in c){
                this.widget.push (item.widget);
                widget.add (item.widget);
                print("page %s added\n", item.widget.tag);
            }

            this.add_action ("pop", (nav) => nav.widget.pop ());
        }
    }
}
