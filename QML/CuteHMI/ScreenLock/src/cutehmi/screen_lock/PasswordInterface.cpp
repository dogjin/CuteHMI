#include "PasswordInterface.hpp"

#include <QDebug>
#include <QDateTime>

namespace cutehmi {
namespace screen_lock {

PasswordInterface::PasswordInterface(QObject *parent) : QObject(parent),
    lowerBoundOfHashes(9000), upperBoundOfHashes(10000)
{
    m_settings = new QSettings("Termotronika", "CuteHMI", this);
    qsrand(QTime::currentTime().msec());
}

bool PasswordInterface::validatePassword(const QString &password)
{
    QString passwordHash = m_settings->value("screenLockPassword").toString();
    QByteArray hash = QCryptographicHash::hash(password.toUtf8(), QCryptographicHash::Sha3_512).toHex();
    for (int i = 0; i < upperBoundOfHashes; ++i)
    {
        if (i >= lowerBoundOfHashes && hash == passwordHash)
            return true;
        hash = QCryptographicHash::hash(hash, QCryptographicHash::Sha3_512).toHex();
    }
    return false;
}

bool PasswordInterface::changePassword(const QString &oldPassword, const QString &newPassword)
{
    if (validatePassword(oldPassword))
    {
        setPassword(newPassword);
        return true;
    }
    return false;
}

void PasswordInterface::setPassword(const QString &password)
{
    QByteArray hash = QCryptographicHash::hash(password.toUtf8(), QCryptographicHash::Sha3_512).toHex();
    for (int i = 0; i < getNumberOfHashes(); ++i)
    {
        hash = QCryptographicHash::hash(hash, QCryptographicHash::Sha3_512).toHex();
    }
    QString passwordHash = hash;
    m_settings->setValue("screenLockPassword", passwordHash);
}

int PasswordInterface::getNumberOfHashes()
{
    return qrand() % (upperBoundOfHashes - lowerBoundOfHashes) + lowerBoundOfHashes;
}

}
}
