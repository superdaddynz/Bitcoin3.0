// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN3_QT_BITCOIN3ADDRESSVALIDATOR_H
#define BITCOIN3_QT_BITCOIN3ADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class Bitcoin3AddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit Bitcoin3AddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Bitcoin3 address widget validator, checks for a valid bitcoin3 address.
 */
class Bitcoin3AddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit Bitcoin3AddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BITCOIN3_QT_BITCOIN3ADDRESSVALIDATOR_H
