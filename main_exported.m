classdef main_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        TabGroup                  matlab.ui.container.TabGroup
        NgiemTab_1                matlab.ui.container.Tab
        NghiemField_1             matlab.ui.control.EditField
        fxEditFieldLabel          matlab.ui.control.Label
        PhanliField_2             matlab.ui.control.NumericEditField
        PhuongphapDropdown_1      matlab.ui.control.DropDown
        PhngphptmDropDownLabel    matlab.ui.control.Label
        SaisoField_1              matlab.ui.control.NumericEditField
        SaisEditFieldLabel        matlab.ui.control.Label
        PhanliField_1             matlab.ui.control.NumericEditField
        KhongphnliEditFieldLabel  matlab.ui.control.Label
        XoaButton_1               matlab.ui.control.Button
        Dothi_Button_1            matlab.ui.control.Button
        Ketqua_Button_1           matlab.ui.control.Button
        KetquaPanel_1             matlab.ui.container.Panel
        KQLap_1                   matlab.ui.control.EditField
        SlnlpEditFieldLabel       matlab.ui.control.Label
        KQNghiem_1                matlab.ui.control.EditField
        NghimEditFieldLabel       matlab.ui.control.Label
        UIAxes_1                  matlab.ui.control.UIAxes
        NisuyTab                  matlab.ui.container.Tab
        Button_14                 matlab.ui.control.StateButton
        Button_13                 matlab.ui.control.StateButton
        Button_12                 matlab.ui.control.StateButton
        Button_11                 matlab.ui.control.StateButton
        Button_10                 matlab.ui.control.StateButton
        Button_9                  matlab.ui.control.StateButton
        Button_8                  matlab.ui.control.StateButton
        HiquyTab                  matlab.ui.container.Tab
        EditField                 matlab.ui.control.NumericEditField
        EditFieldLabel            matlab.ui.control.Label
        Button_21                 matlab.ui.control.StateButton
        Button_20                 matlab.ui.control.StateButton
        Button_19                 matlab.ui.control.StateButton
        Button_18                 matlab.ui.control.StateButton
        Button_17                 matlab.ui.control.StateButton
        Button_16                 matlab.ui.control.StateButton
        Button_15                 matlab.ui.control.StateButton
        ohmTab                    matlab.ui.container.Tab
        Button_29                 matlab.ui.control.StateButton
        Button_28                 matlab.ui.control.StateButton
        Button_27                 matlab.ui.control.StateButton
        Button_26                 matlab.ui.control.StateButton
        Button_25                 matlab.ui.control.StateButton
        Button_24                 matlab.ui.control.StateButton
        Button_23                 matlab.ui.control.StateButton
        Button_22                 matlab.ui.control.StateButton
        TchphnTab                 matlab.ui.container.Tab
        Button_36                 matlab.ui.control.StateButton
        Button_35                 matlab.ui.control.StateButton
        Button_34                 matlab.ui.control.StateButton
        Button_33                 matlab.ui.control.StateButton
        Button_32                 matlab.ui.control.StateButton
        Button_31                 matlab.ui.control.StateButton
        Button_30                 matlab.ui.control.StateButton
        GiithiunhmTab             matlab.ui.container.Tab
        Button_37                 matlab.ui.control.StateButton
    end

    
    methods (Access = public)
        
        function [nghiem, solanlap] = chiadoi(f, a, b, saiso)
    solanlap = 0;
    while abs(a-b) > saiso
        c = (a + b) / 2;
        solanlap = solanlap + 1;
        if f(a)*f(c) > 0
            a = c;
        else
            b = c;
        end
    end
    nghiem = (a + b) / 2;
end
        
      end


    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Ketqua_Button_1
        function Ketqua_Button_1Pushed(app, event)
            
            f = @(x) 3*x^3 - 8*x^2 - 20*x + 16;
            a = app.PhanliField_1.Value;
            b = app.PhanliField_2.Value;
            saiso = app.SaisoField_1.Value;

            [nghiem, solanlap] = chiadoi(app, f, a, b, saiso);
            app.KQNghiem_1.Value = num2str(nghiem);
            app.KQLap_1.Value = num2str(solanlap);
            

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 640 480];

            % Create NgiemTab_1
            app.NgiemTab_1 = uitab(app.TabGroup);
            app.NgiemTab_1.Title = 'Nghiệm';

            % Create UIAxes_1
            app.UIAxes_1 = uiaxes(app.NgiemTab_1);
            title(app.UIAxes_1, 'Đồ thị hàm số')
            xlabel(app.UIAxes_1, 'x')
            ylabel(app.UIAxes_1, 'f(x)')
            zlabel(app.UIAxes_1, 'Z')
            app.UIAxes_1.FontSize = 14;
            app.UIAxes_1.Position = [311 225 306 218];

            % Create KetquaPanel_1
            app.KetquaPanel_1 = uipanel(app.NgiemTab_1);
            app.KetquaPanel_1.TitlePosition = 'centertop';
            app.KetquaPanel_1.Title = 'Kết quả';
            app.KetquaPanel_1.Position = [32 32 299 163];

            % Create NghimEditFieldLabel
            app.NghimEditFieldLabel = uilabel(app.KetquaPanel_1);
            app.NghimEditFieldLabel.HorizontalAlignment = 'right';
            app.NghimEditFieldLabel.Position = [32 91 50 22];
            app.NghimEditFieldLabel.Text = 'Nghiệm:';

            % Create KQNghiem_1
            app.KQNghiem_1 = uieditfield(app.KetquaPanel_1, 'text');
            app.KQNghiem_1.Position = [97 86 112 32];

            % Create SlnlpEditFieldLabel
            app.SlnlpEditFieldLabel = uilabel(app.KetquaPanel_1);
            app.SlnlpEditFieldLabel.HorizontalAlignment = 'right';
            app.SlnlpEditFieldLabel.Position = [20 40 62 22];
            app.SlnlpEditFieldLabel.Text = 'Số lần lặp:';

            % Create KQLap_1
            app.KQLap_1 = uieditfield(app.KetquaPanel_1, 'text');
            app.KQLap_1.Position = [97 35 112 32];

            % Create Ketqua_Button_1
            app.Ketqua_Button_1 = uibutton(app.NgiemTab_1, 'push');
            app.Ketqua_Button_1.ButtonPushedFcn = createCallbackFcn(app, @Ketqua_Button_1Pushed, true);
            app.Ketqua_Button_1.FontSize = 18;
            app.Ketqua_Button_1.Position = [360 127 242 54];
            app.Ketqua_Button_1.Text = 'Kết quả';

            % Create Dothi_Button_1
            app.Dothi_Button_1 = uibutton(app.NgiemTab_1, 'push');
            app.Dothi_Button_1.Position = [360 67 155 50];
            app.Dothi_Button_1.Text = 'Vẽ đồ thị';

            % Create XoaButton_1
            app.XoaButton_1 = uibutton(app.NgiemTab_1, 'push');
            app.XoaButton_1.Position = [529 67 73 50];
            app.XoaButton_1.Text = 'Xóa';

            % Create KhongphnliEditFieldLabel
            app.KhongphnliEditFieldLabel = uilabel(app.NgiemTab_1);
            app.KhongphnliEditFieldLabel.HorizontalAlignment = 'right';
            app.KhongphnliEditFieldLabel.Position = [38 349 85 22];
            app.KhongphnliEditFieldLabel.Text = 'Khoảng phân li';

            % Create PhanliField_1
            app.PhanliField_1 = uieditfield(app.NgiemTab_1, 'numeric');
            app.PhanliField_1.Position = [147 344 51 33];

            % Create SaisEditFieldLabel
            app.SaisEditFieldLabel = uilabel(app.NgiemTab_1);
            app.SaisEditFieldLabel.HorizontalAlignment = 'right';
            app.SaisEditFieldLabel.Position = [38 299 38 22];
            app.SaisEditFieldLabel.Text = 'Sai số';

            % Create SaisoField_1
            app.SaisoField_1 = uieditfield(app.NgiemTab_1, 'numeric');
            app.SaisoField_1.Position = [84 294 51 33];

            % Create PhngphptmDropDownLabel
            app.PhngphptmDropDownLabel = uilabel(app.NgiemTab_1);
            app.PhngphptmDropDownLabel.HorizontalAlignment = 'right';
            app.PhngphptmDropDownLabel.Position = [41 257 94 22];
            app.PhngphptmDropDownLabel.Text = 'Phương pháp tìm';

            % Create PhuongphapDropdown_1
            app.PhuongphapDropdown_1 = uidropdown(app.NgiemTab_1);
            app.PhuongphapDropdown_1.Items = {'CD', 'L', 'T', 'D'};
            app.PhuongphapDropdown_1.Position = [147 257 150 22];
            app.PhuongphapDropdown_1.Value = 'CD';

            % Create PhanliField_2
            app.PhanliField_2 = uieditfield(app.NgiemTab_1, 'numeric');
            app.PhanliField_2.Position = [215 344 45 33];

            % Create fxEditFieldLabel
            app.fxEditFieldLabel = uilabel(app.NgiemTab_1);
            app.fxEditFieldLabel.HorizontalAlignment = 'right';
            app.fxEditFieldLabel.FontAngle = 'italic';
            app.fxEditFieldLabel.Position = [41 391 36 22];
            app.fxEditFieldLabel.Text = 'f(x) = ';

            % Create NghiemField_1
            app.NghiemField_1 = uieditfield(app.NgiemTab_1, 'text');
            app.NghiemField_1.FontAngle = 'italic';
            app.NghiemField_1.Position = [85 388 175 28];

            % Create NisuyTab
            app.NisuyTab = uitab(app.TabGroup);
            app.NisuyTab.Title = 'Nội suy';

            % Create Button_8
            app.Button_8 = uibutton(app.NisuyTab, 'state');
            app.Button_8.Text = 'Button';
            app.Button_8.Position = [32 369 240 32];

            % Create Button_9
            app.Button_9 = uibutton(app.NisuyTab, 'state');
            app.Button_9.Text = 'Button';
            app.Button_9.Position = [32 304 240 32];

            % Create Button_10
            app.Button_10 = uibutton(app.NisuyTab, 'state');
            app.Button_10.Text = 'Button';
            app.Button_10.Position = [32 224 240 32];

            % Create Button_11
            app.Button_11 = uibutton(app.NisuyTab, 'state');
            app.Button_11.Text = 'Button';
            app.Button_11.Position = [330 254 240 147];

            % Create Button_12
            app.Button_12 = uibutton(app.NisuyTab, 'state');
            app.Button_12.Text = 'Button';
            app.Button_12.Position = [330 96 240 32];

            % Create Button_13
            app.Button_13 = uibutton(app.NisuyTab, 'state');
            app.Button_13.Text = 'Button';
            app.Button_13.Position = [32 149 240 32];

            % Create Button_14
            app.Button_14 = uibutton(app.NisuyTab, 'state');
            app.Button_14.Text = 'Button';
            app.Button_14.Position = [32 96 240 32];

            % Create HiquyTab
            app.HiquyTab = uitab(app.TabGroup);
            app.HiquyTab.Title = 'Hồi quy';

            % Create Button_15
            app.Button_15 = uibutton(app.HiquyTab, 'state');
            app.Button_15.Text = 'Button';
            app.Button_15.Position = [32 369 240 32];

            % Create Button_16
            app.Button_16 = uibutton(app.HiquyTab, 'state');
            app.Button_16.Text = 'Button';
            app.Button_16.Position = [32 304 240 32];

            % Create Button_17
            app.Button_17 = uibutton(app.HiquyTab, 'state');
            app.Button_17.Text = 'Button';
            app.Button_17.Position = [32 224 240 32];

            % Create Button_18
            app.Button_18 = uibutton(app.HiquyTab, 'state');
            app.Button_18.Text = 'Button';
            app.Button_18.Position = [330 254 240 147];

            % Create Button_19
            app.Button_19 = uibutton(app.HiquyTab, 'state');
            app.Button_19.Text = 'Button';
            app.Button_19.Position = [330 96 240 32];

            % Create Button_20
            app.Button_20 = uibutton(app.HiquyTab, 'state');
            app.Button_20.Text = 'Button';
            app.Button_20.Position = [32 149 240 32];

            % Create Button_21
            app.Button_21 = uibutton(app.HiquyTab, 'state');
            app.Button_21.Text = 'Button';
            app.Button_21.Position = [32 96 240 32];

            % Create EditFieldLabel
            app.EditFieldLabel = uilabel(app.HiquyTab);
            app.EditFieldLabel.HorizontalAlignment = 'right';
            app.EditFieldLabel.Position = [396 194 55 22];
            app.EditFieldLabel.Text = 'Edit Field';

            % Create EditField
            app.EditField = uieditfield(app.HiquyTab, 'numeric');
            app.EditField.Position = [466 194 100 22];

            % Create ohmTab
            app.ohmTab = uitab(app.TabGroup);
            app.ohmTab.Title = 'Đạo hàm';

            % Create Button_22
            app.Button_22 = uibutton(app.ohmTab, 'state');
            app.Button_22.Text = 'Button';
            app.Button_22.Position = [32 369 240 32];

            % Create Button_23
            app.Button_23 = uibutton(app.ohmTab, 'state');
            app.Button_23.Text = 'Button';
            app.Button_23.Position = [32 304 240 32];

            % Create Button_24
            app.Button_24 = uibutton(app.ohmTab, 'state');
            app.Button_24.Text = 'Button';
            app.Button_24.Position = [32 224 240 32];

            % Create Button_25
            app.Button_25 = uibutton(app.ohmTab, 'state');
            app.Button_25.Text = 'Button';
            app.Button_25.Position = [330 369 240 32];

            % Create Button_26
            app.Button_26 = uibutton(app.ohmTab, 'state');
            app.Button_26.Text = 'Button';
            app.Button_26.Position = [330 96 240 32];

            % Create Button_27
            app.Button_27 = uibutton(app.ohmTab, 'state');
            app.Button_27.Text = 'Button';
            app.Button_27.Position = [32 149 240 32];

            % Create Button_28
            app.Button_28 = uibutton(app.ohmTab, 'state');
            app.Button_28.Text = 'Button';
            app.Button_28.Position = [32 96 240 32];

            % Create Button_29
            app.Button_29 = uibutton(app.ohmTab, 'state');
            app.Button_29.Text = 'Button';
            app.Button_29.Position = [330 304 240 32];

            % Create TchphnTab
            app.TchphnTab = uitab(app.TabGroup);
            app.TchphnTab.Title = 'Tích phân';

            % Create Button_30
            app.Button_30 = uibutton(app.TchphnTab, 'state');
            app.Button_30.Text = 'Button';
            app.Button_30.Position = [32 369 240 32];

            % Create Button_31
            app.Button_31 = uibutton(app.TchphnTab, 'state');
            app.Button_31.Text = 'Button';
            app.Button_31.Position = [32 299 240 32];

            % Create Button_32
            app.Button_32 = uibutton(app.TchphnTab, 'state');
            app.Button_32.Text = 'Button';
            app.Button_32.Position = [32 194 240 32];

            % Create Button_33
            app.Button_33 = uibutton(app.TchphnTab, 'state');
            app.Button_33.Text = 'Button';
            app.Button_33.Position = [330 369 240 32];

            % Create Button_34
            app.Button_34 = uibutton(app.TchphnTab, 'state');
            app.Button_34.Text = 'Button';
            app.Button_34.Position = [330 299 240 32];

            % Create Button_35
            app.Button_35 = uibutton(app.TchphnTab, 'state');
            app.Button_35.Text = 'Button';
            app.Button_35.Position = [330 194 240 32];

            % Create Button_36
            app.Button_36 = uibutton(app.TchphnTab, 'state');
            app.Button_36.Text = 'Button';
            app.Button_36.Position = [200 96 240 32];

            % Create GiithiunhmTab
            app.GiithiunhmTab = uitab(app.TabGroup);
            app.GiithiunhmTab.Title = 'Giới thiệu nhóm';

            % Create Button_37
            app.Button_37 = uibutton(app.GiithiunhmTab, 'state');
            app.Button_37.Text = 'Button';
            app.Button_37.Position = [330 369 240 32];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = main_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
