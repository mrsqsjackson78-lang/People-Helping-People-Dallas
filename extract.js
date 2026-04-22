import gettextParser from 'gettext-parser';
import fs from 'fs';

const KEYS = [
  'app.title',
  'help.request.title',
  'help.request.description',
  'button.submit',
  'button.cancel',
  'notification.help.available'
];

const pot = {
  charset: 'UTF-8',
  translations: {
    '': Object.fromEntries(
      KEYS.map(k => [k, { msgid: k, msgstr: [''] }])
    )
  }
};

fs.writeFileSync('i18n/messages.pot', gettextParser.po.compile(pot));