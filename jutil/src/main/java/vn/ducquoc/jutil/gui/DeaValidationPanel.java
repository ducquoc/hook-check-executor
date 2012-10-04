package vn.ducquoc.jutil.gui;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import vn.ducquoc.jutil.HealthcareUtil;

public class DeaValidationPanel extends JPanel {

    private static final long serialVersionUID = 1L;

    JLabel introLabel;
    JPanel introPanel;

    JTextField validationTextField;
    JPanel validationPanel;
    JButton validationButton;
    JLabel validationLabel;

    public DeaValidationPanel() {

        introPanel = new JPanel();
        introLabel = new JLabel("Enter your 9-char DEA identity for validation");
        introPanel.add(introLabel);
        add(introPanel, BorderLayout.NORTH);

        validationPanel = new JPanel();
        validationTextField = new JTextField("AB1234563", 10);
        validationPanel.add(validationTextField);
        add(validationPanel, BorderLayout.CENTER);

        validationButton = new JButton("Validate");
        validationPanel.add(validationButton);

        validationLabel = new JLabel("             ");
        validationLabel.setFont(new Font("Arial", Font.BOLD, 11));
        validationPanel.add(validationLabel);

        validationButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent actionEvent) {

                validationLabel.setText(""); // clean old message

                String deaText = validationTextField.getText().trim();
                if (HealthcareUtil.isValidDea(deaText)) {
                    validationLabel.setText("VALID  ");
                } else {
                    validationLabel.setText("INVALID");
                }
            }
        });

        validationTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent actionEvent) {

                validationLabel.setText(""); // clean old message

                String deaText = validationTextField.getText().trim();
                if (HealthcareUtil.isValidDea(deaText)) {
                    validationLabel.setText("VALID  ");
                } else {
                    validationLabel.setText("INVALID");
                }
            }
        });
    }

}
