// PiFLX mode chooser: pick one performance application per session.
//
// Prints the chosen mode id on stdout and exits 0. Any other exit status means
// "no choice"; the caller is expected to fall back to its previous default so a
// broken menu can never leave the device with nothing running.
#include <QApplication>
#include <QGuiApplication>
#include <QLabel>
#include <QPushButton>
#include <QScreen>
#include <QTimer>
#include <QVBoxLayout>
#include <QWidget>
#include <cstdio>
#include <string>

namespace {
// Modes are declared here rather than discovered, so the menu can never offer
// something the installed scripts cannot actually start.
struct Mode { const char *id; const char *title; const char *detail; };
const Mode kModes[] = {
    {"bitedj", "BiteDJ", "Mixxx performance build — your usual setup"},
    {"az", "XDJ-AZ", "Native AZ player with your Rekordbox library"},
};

QPushButton *modeButton(const Mode &mode) {
    auto *button = new QPushButton(
        QString("%1\n%2").arg(QString::fromUtf8(mode.title), QString::fromUtf8(mode.detail)));
    button->setMinimumHeight(180);
    button->setCursor(Qt::PointingHandCursor);
    button->setStyleSheet(
        "QPushButton{background:#141414;color:#f0f0f0;border:2px solid #2a2a2a;"
        "border-radius:14px;font-size:34px;font-weight:600;padding:18px;text-align:center;}"
        "QPushButton:pressed{background:#0a63c2;border-color:#0a63c2;}");
    return button;
}
}  // namespace

int main(int argc, char **argv) {
    QApplication app(argc, argv);
    QWidget window;
    window.setStyleSheet("background:#000000;");
    auto *layout = new QVBoxLayout(&window);
    layout->setContentsMargins(64, 48, 64, 48);
    layout->setSpacing(28);

    auto *heading = new QLabel(QStringLiteral("PiFLX"));
    heading->setAlignment(Qt::AlignCenter);
    heading->setStyleSheet("color:#8a8a8a;font-size:26px;letter-spacing:6px;font-weight:600;");
    layout->addWidget(heading);
    layout->addStretch(1);

    std::string chosen;
    for (const Mode &mode : kModes) {
        QPushButton *button = modeButton(mode);
        const std::string id = mode.id;
        QObject::connect(button, &QPushButton::clicked, &app, [&chosen, id, &app]() {
            chosen = id;
            app.quit();
        });
        layout->addWidget(button);
    }

    layout->addStretch(1);
    auto *footer = new QLabel(
        QStringLiteral("In XDJ-AZ, hold BOTH MERGE FX buttons for 2 seconds to come back here."));
    footer->setAlignment(Qt::AlignCenter);
    footer->setWordWrap(true);
    footer->setStyleSheet("color:#6a6a6a;font-size:20px;");
    layout->addWidget(footer);

    window.showFullScreen();
    app.exec();

    if (chosen.empty()) return 1;
    std::printf("%s\n", chosen.c_str());
    return 0;
}
