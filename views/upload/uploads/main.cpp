#include "mainwindow.h"
#include <QApplication>
#include <QtNetwork/QNetworkAccessManager>
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.readCreats();
    w.show();
    return a.exec();
}
