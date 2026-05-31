/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText:  2017-2024 Lains
 *                          2025 Contributions from the ellie_Commons community (github.com/ellie-commons/)
 *                          2025-2026 Stella & Charlie (teamcons.carrd.co)
 */

public class Jorts.Autostart {

    Xdp.Portal portal;
    GenericArray<weak string> cmd;

    //public signal void result (bool if_accepted);

    private bool _enabled;
    public bool enabled {
        get {
            warning (_("Returned value is only internal. The app cannot read the systems actual state"));
            return false;}
        set {
            _enabled = value;
            if (value) {
                request_set ();
                return;
            };
            request_remove ();
        }
    }

    public Autostart (bool internal_state) {
        portal = new Xdp.Portal ();
        cmd = new GenericArray<weak string> ();
        cmd.add (APP_ID);
        _enabled = internal_state;
    }

    public void request_remove () {
        portal.request_background.begin (
            null,
            _("Remove Jorts from system autostart"),
            cmd,
            Xdp.BackgroundFlags.NONE,
            null,
            (obj, red) => {print ("lol");});
    }

    public void request_set () {
        portal.request_background.begin (
            null,
            _("Set Jorts to start with the computer"),
            cmd,
            Xdp.BackgroundFlags.AUTOSTART,
            null);
    }
}
