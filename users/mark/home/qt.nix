{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.qt5ct
    # pkgs.libsForQt5.qt5.qt5ct
    pkgs.libsForQt5.qtstyleplugin-kvantum

    pkgs.adwaita-qt
    pkgs.libadwaita
    pkgs.materia-theme
    pkgs.materia-kde-theme
    pkgs.dolphin
    # pkgs.whitesur-gtk-theme
    # pkgs.whitesur-icon-theme
  ];

  wayland.windowManager.sway = {
    extraSessionCommands = ''
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

      export QT_QPA_PLATFORMTHEME=qt5ct
    '';
  };

  xdg.configFile =
    let
      scheme = config.colorscheme;
    in
    {
      # https://github.com/mnussbaum/base16-qt5ct
      "qt5ct/colors/base16-${scheme.slug}.conf" = {
        text = ''
          /*
          *
          * Base16 ${ scheme.name }
          * Author: ${ scheme.author }
          *
          */

          [ColorScheme]
          active_colors=#ff${ scheme.colors.base0C }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base04 }, #ff${ scheme.colors.base0E }, #ff${ scheme.colors.base06 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base00 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base0E }, #ff${ scheme.colors.base09 }, #ff${ scheme.colors.base08 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base0E }, #8f${ scheme.colors.base0E }
          disabled_colors=#ff${ scheme.colors.base0F }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base04 }, #ff${ scheme.colors.base0F }, #ff${ scheme.colors.base0F }, #ff${ scheme.colors.base0F }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base00 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base0E }, #ff${ scheme.colors.base09 }, #ff${ scheme.colors.base08 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base0F }, #8f${ scheme.colors.base0F }
          inactive_colors=#ff${ scheme.colors.base0C }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base04 }, #ff${ scheme.colors.base0E }, #ff${ scheme.colors.base06 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base00 }, #ff${ scheme.colors.base03 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base0E }, #ff${ scheme.colors.base09 }, #ff${ scheme.colors.base08 }, #ff${ scheme.colors.base02 }, #ff${ scheme.colors.base05 }, #ff${ scheme.colors.base01 }, #ff${ scheme.colors.base0E }, #8f${ scheme.colors.base0E }
        '';
      };

      "Kvantum/MateriaDark/MateriaDark.kvconfig" = {
        text = ''
          [%General]
          author=Alexey Varfolomeev, based on KvAdaptaDark by Tsu Jan
          comment=A dark variant of the Materia GTK theme
          alt_mnemonic=true
          animate_states=true
          attach_active_tab=false
          blurring=false
          button_contents_shift=false
          button_icon_size=16
          center_toolbar_handle=true
          check_size=16
          combo_as_lineedit=true
          combo_focus_rect=false
          combo_menu=true
          composite=true
          double_click=false
          fill_rubberband=false
          group_toolbar_buttons=false
          groupbox_top_label=true
          hide_combo_checkboxes=true
          inline_spin_indicators=true
          joined_inactive_tabs=true
          large_icon_size=32
          layout_margin=9
          layout_spacing=6
          left_tabs=true
          menu_shadow_depth=5
          menubar_mouse_tracking=true
          merge_menubar_with_toolbar=true
          mirror_doc_tabs=true
          no_inactiveness=false
          no_window_pattern=false
          opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,trojita,dragon,digikam
          popup_blurring=false
          progressbar_thickness=2
          reduce_menu_opacity=0
          reduce_window_opacity=0
          respect_DE=true
          scroll_arrows=false
          scroll_min_extent=60
          scroll_width=9
          scrollable_menu=false
          scrollbar_in_view=true
          slider_handle_length=22
          slider_handle_width=23
          slider_width=2
          small_icon_size=16
          spin_button_width=24
          splitter_width=4
          spread_menuitems=true
          spread_progressbar=true
          submenu_delay=250
          submenu_overlap=0
          textless_progressbar=false
          tickless_slider_handle_size=22
          toolbar_icon_size=22
          toolbar_interior_spacing=2
          toolbar_item_spacing=0
          toolbutton_style=1
          tooltip_delay=-1
          tooltip_shadow_depth=2
          transient_groove=false
          transient_scrollbar=true
          translucent_windows=false
          tree_branch_line=true
          vertical_spin_indicators=false
          x11drag=menubar_and_primary_toolbar
          click_behavior=0
          contrast=1.00
          dialog_button_layout=0
          intensity=1.00
          saturation=1.00
          shadowless_popup=false

          [GeneralColors]
          alt.base.color=#${scheme.colors.base00}
          base.color=#${scheme.colors.base00}
          button.color=#${scheme.colors.base02}
          button.text.color=#${scheme.colors.base06}
          dark.color=#0d0d0d
          disabled.text.color=#818181
          highlight.color=#8ab4f83c
          highlight.text.color=white
          inactive.highlight.color=#8ab4f83c
          light.color=#${scheme.colors.base02}
          link.color=#8ab4f8
          link.visited.color=#ce93d8
          mid.color=#2e2e2e
          mid.light.color=#ffffff1e
          progress.indicator.text.color=#${scheme.colors.base06}
          text.color=#${scheme.colors.base06}
          tooltip.text.color=white
          window.color=#${scheme.colors.base00}
          window.text.color=#${scheme.colors.base06}

          [Hacks]
          blur_translucent=false
          disabled_icon_opacity=70
          force_size_grip=true
          iconless_menu=false
          iconless_pushbutton=true
          kcapacitybar_as_progressbar=true
          lxqtmainmenu_iconsize=16
          middle_click_scroll=false
          no_selection_tint=true
          normal_default_pushbutton=true
          opaque_colors=false
          respect_darkness=true
          single_top_toolbar=true
          tint_on_mouseover=0
          transparent_arrow_button=true
          transparent_dolphin_view=false
          transparent_ktitle_label=false
          transparent_menutitle=false
          transparent_pcmanfm_sidepane=false
          transparent_pcmanfm_view=false
          centered_forms=false
          kinetic_scrolling=false
          noninteger_translucency=false
          scroll_jump_workaround=false

          [PanelButtonCommand]
          frame=true
          frame.element=button
          frame.top=4
          frame.bottom=4
          frame.left=4
          frame.right=4
          interior=true
          interior.element=button
          indicator.size=8
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.press.color=#${scheme.colors.base06}
          text.toggle.color=#8ab4f8
          text.shadow=0
          text.margin=1
          text.iconspacing=4
          indicator.element=arrow
          text.margin.top=2
          text.margin.bottom=3
          text.margin.left=2
          text.margin.right=2
          frame.expansion=0

          [PanelButtonTool]
          inherits=PanelButtonCommand
          text.normal.color=#${scheme.colors.base06}
          text.bold=false
          indicator.element=arrow
          indicator.size=8
          frame.expansion=24

          [ToolbarButton]
          frame.element=tbutton
          interior.element=tbutton
          indicator.element=tarrow
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.press.color=white
          text.toggle.color=white
          text.bold=false
          frame.expansion=24

          [Dock]
          inherits=PanelButtonCommand
          interior.element=dock
          frame.element=dock
          frame.top=1
          frame.bottom=1
          frame.left=1
          frame.right=1
          text.normal.color=#${scheme.colors.base06}

          [DockTitle]
          inherits=PanelButtonCommand
          frame=false
          interior=false
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.bold=false

          [IndicatorSpinBox]
          inherits=PanelButtonCommand
          frame=true
          interior=true
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2
          indicator.element=spin
          indicator.size=8
          text.normal.color=#${scheme.colors.base06}
          text.margin.top=2
          text.margin.bottom=2
          text.margin.left=2
          text.margin.right=2

          [RadioButton]
          inherits=PanelButtonCommand
          frame=false
          interior.element=radio
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          min_width=+0.3font
          min_height=+0.3font

          [CheckBox]
          inherits=PanelButtonCommand
          frame=false
          interior.element=checkbox
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          min_width=+0.3font
          min_height=+0.3font

          [Focus]
          inherits=PanelButtonCommand
          frame=true
          frame.element=focus
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2
          frame.patternsize=14

          [GenericFrame]
          inherits=PanelButtonCommand
          frame=true
          interior=false
          frame.element=common
          interior.element=common
          frame.top=1
          frame.bottom=1
          frame.left=1
          frame.right=1

          [LineEdit]
          inherits=PanelButtonCommand
          frame.element=lineedit
          interior.element=lineedit
          interior=true
          frame.top=4
          frame.bottom=4
          frame.left=4
          frame.right=4
          text.margin.top=7
          text.margin.bottom=7
          text.margin.left=6
          text.margin.right=6
          frame.expansion=0

          [ToolbarLineEdit]
          inherits=PanelButtonCommand
          frame.element=tlineedit
          interior.element=tlineedit
          interior=true
          frame.top=4
          frame.bottom=4
          frame.left=4
          frame.right=4
          text.margin.top=7
          text.margin.bottom=7
          text.margin.left=6
          text.margin.right=6
          frame.expansion=0

          [DropDownButton]
          inherits=PanelButtonCommand
          indicator.element=arrow-down

          [IndicatorArrow]
          indicator.element=arrow
          indicator.size=8

          [ToolboxTab]
          inherits=PanelButtonCommand
          text.normal.color=#${scheme.colors.base06}
          text.press.color=#${scheme.colors.base06}
          text.focus.color=white

          [Tab]
          inherits=PanelButtonCommand
          interior.element=tab
          text.margin.left=8
          text.margin.right=8
          text.margin.top=2
          text.margin.bottom=2
          frame.element=tab
          indicator.element=tab
          indicator.size=22
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=#${scheme.colors.base06}
          text.toggle.color=#8ab4f8
          frame.expansion=0
          text.bold=false
          focusFrame=true

          [TabFrame]
          inherits=PanelButtonCommand
          frame.element=tabframe
          interior.element=tabframe
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2

          [TreeExpander]
          inherits=PanelButtonCommand
          indicator.size=8
          indicator.element=tree

          [HeaderSection]
          inherits=PanelButtonCommand
          interior.element=header
          frame.element=header
          frame.top=0
          frame.bottom=1
          frame.left=0
          frame.right=1
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.press.color=white
          text.toggle.color=white
          frame.expansion=0

          [SizeGrip]
          indicator.element=resize-grip

          [Toolbar]
          inherits=PanelButtonCommand
          indicator.element=toolbar
          indicator.size=5
          text.margin=0
          interior.element=menubar
          frame.element=menubar
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          frame.left=0
          frame.right=0
          frame.top=0
          frame.bottom=4
          frame.expansion=0

          [Slider]
          inherits=PanelButtonCommand
          frame.element=slider
          focusFrame=true
          interior.element=slider
          frame.top=3
          frame.bottom=3
          frame.left=3
          frame.right=3

          [SliderCursor]
          inherits=PanelButtonCommand
          frame=false
          interior.element=slidercursor

          [Progressbar]
          inherits=PanelButtonCommand
          frame.element=progress
          interior.element=progress
          text.margin=0
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=#${scheme.colors.base06}
          text.press.color=#${scheme.colors.base06}
          text.toggle.color=#${scheme.colors.base06}
          text.bold=false
          frame.expansion=8

          [ProgressbarContents]
          inherits=PanelButtonCommand
          frame=true
          frame.element=progress-pattern
          interior.element=progress-pattern

          [ItemView]
          inherits=PanelButtonCommand
          text.margin=0
          frame.element=itemview
          interior.element=itemview
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2
          text.margin.top=2
          text.margin.bottom=2
          text.margin.left=4
          text.margin.right=4
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.press.color=white
          text.toggle.color=white
          min_width=+0.3font
          min_height=+0.3font
          frame.expansion=0

          [Splitter]
          indicator.size=48

          [Scrollbar]
          inherits=PanelButtonCommand
          indicator.element=arrow
          indicator.size=12

          [ScrollbarSlider]
          inherits=PanelButtonCommand
          frame.element=scrollbarslider
          interior=false
          frame.left=5
          frame.right=5
          frame.top=5
          frame.bottom=5
          indicator.element=grip
          indicator.size=12

          [ScrollbarGroove]
          inherits=PanelButtonCommand
          interior=false
          frame=false

          [MenuItem]
          inherits=PanelButtonCommand
          frame=true
          frame.element=menuitem
          interior.element=menuitem
          indicator.element=menuitem
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=#${scheme.colors.base06}
          text.margin.top=2
          text.margin.bottom=2
          text.margin.left=4
          text.margin.right=4
          frame.top=0
          frame.bottom=0
          frame.left=0
          frame.right=0
          frame.expansion=0

          [MenuBar]
          inherits=PanelButtonCommand
          frame.element=menubar
          interior.element=menubar
          frame.bottom=0
          text.normal.color=#${scheme.colors.base06}
          frame.expansion=0
          text.bold=false

          [MenuBarItem]
          inherits=PanelButtonCommand
          interior=true
          interior.element=menubaritem
          frame.element=menubaritem
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2
          text.margin.left=4
          text.margin.right=4
          text.margin.top=0
          text.margin.bottom=0
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.bold=false
          min_width=+0.3font
          min_height=+0.3font
          frame.expansion=0

          [TitleBar]
          inherits=PanelButtonCommand
          frame=false
          text.margin.top=2
          text.margin.bottom=2
          text.margin.left=2
          text.margin.right=2
          interior.element=titlebar
          indicator.size=16
          indicator.element=mdi
          text.normal.color=#787878
          text.focus.color=#${scheme.colors.base06}
          text.bold=false
          text.italic=true
          frame.expansion=0

          [ComboBox]
          inherits=PanelButtonCommand
          frame.element=combo
          interior.element=combo
          interior=true
          frame.top=4
          frame.bottom=4
          frame.left=4
          frame.right=4
          text.margin.top=7
          text.margin.bottom=7
          text.margin.left=6
          text.margin.right=6
          text.focus.color=white
          text.press.color=#${scheme.colors.base06}
          text.toggle.color=white
          frame.expansion=0

          [Menu]
          inherits=PanelButtonCommand
          frame.top=3
          frame.bottom=3
          frame.left=3
          frame.right=3
          frame.element=menu
          interior.element=menu
          text.normal.color=#${scheme.colors.base06}
          frame.expansion=0

          [GroupBox]
          inherits=GenericFrame
          frame=false
          text.shadow=0
          text.margin=0
          text.normal.color=#${scheme.colors.base06}
          text.focus.color=white
          text.bold=false
          frame.expansion=0

          [TabBarFrame]
          inherits=GenericFrame
          frame=true
          frame.element=tabBarFrame
          interior=false
          frame.top=2
          frame.bottom=2
          frame.left=2
          frame.right=2

          [ToolTip]
          inherits=GenericFrame
          frame=true
          frame.top=3
          frame.bottom=3
          frame.left=3
          frame.right=3
          interior=true
          text.shadow=0
          text.margin=0
          interior.element=tooltip
          frame.element=tooltip
          frame.expansion=46

          [StatusBar]
          inherits=GenericFrame
          frame=false
          interior=false

          [Window]
          interior=true
          interior.element=window

          [Dialog]
          interior=true
          interior.element=dialog
        '';
      };
    };
}
