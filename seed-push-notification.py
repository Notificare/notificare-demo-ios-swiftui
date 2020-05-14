import json
import os
import requests

deviceId = os.environ['DEVICE_ID']
applicationKey = os.environ['APPLICATION_KEY']
applicationMasterSecret = os.environ['APPLICATION_MASTER_SECRET']

notifications = [
  {
    'title': 'Proin at nibh vitae dui hendrerit laoreet.',
    'message': 'Ut at mi nec dolor accumsan vestibulum eget in elit. Fusce gravida urna suscipit, tincidunt dui eget, mollis orci.',
    'attachment': 'https://i.picsum.photos/id/100/160/120.jpg',
  },
  {
    'title': 'Proin id sem dapibus, dignissim arcu quis, aliquam orci.',
    'message': 'Quisque ipsum sapien, vestibulum nec erat id, venenatis faucibus metus.',
  },
  {
    'title': 'Curabitur a erat hendrerit, volutpat tortor eget, dapibus quam.',
    'message': 'Aliquam gravida tortor varius, interdum ex quis, volutpat est. Curabitur pellentesque nunc in nisi maximus viverra. Integer eu purus metus.',
    'attachment': 'https://i.picsum.photos/id/101/160/120.jpg',
  },
  {
    'title': 'Quisque sit amet quam vel urna sagittis convallis vel eget ex.',
    'message': 'Maecenas auctor neque vel dolor semper placerat. Phasellus et quam facilisis, fringilla mauris in, pretium risus. Nulla et pretium leo.',
    'attachment': 'https://i.picsum.photos/id/102/160/120.jpg',
  },
  {
    'title': 'Curabitur commodo augue in neque varius rutrum.',
    'message': 'Mauris congue massa tellus, ut cursus urna pretium vitae.',
    'attachment': 'https://i.picsum.photos/id/103/160/120.jpg',
  },
  {
    'title': 'In convallis orci nec diam maximus cursus.',
    'message': 'Etiam porta nibh et nisi facilisis, faucibus convallis elit pulvinar. Praesent porta nulla tellus, non hendrerit purus pretium a.',
    'attachment': 'https://i.picsum.photos/id/104/160/120.jpg',
  },
  {
    'title': 'Phasellus quis nulla hendrerit, elementum diam cursus, blandit felis.',
    'message': 'Sed mollis, lorem et feugiat elementum, elit lectus mattis massa, et cursus nisi ex id lorem.',
    'attachment': 'https://i.picsum.photos/id/105/160/120.jpg',
  },
  {
    'title': 'Nulla laoreet quam feugiat ante laoreet suscipit id sit amet massa.',
    'message': 'Suspendisse tincidunt viverra tellus, non tempor dolor rutrum id. Integer vitae vestibulum ipsum, quis cursus odio. Integer ornare gravida interdum.',
    'attachment': 'https://i.picsum.photos/id/106/160/120.jpg',
  },
  {
    'title': 'Donec ut dui finibus, dapibus dui sed, congue ipsum.',
    'message': 'Nam pretium pellentesque ipsum, at pharetra elit semper non. Vestibulum porta, nulla non dapibus mattis, purus lorem pretium libero, quis dapibus mi ipsum sed nunc.',
    'attachment': 'https://i.picsum.photos/id/107/160/120.jpg',
  },
  {
    'title': 'Proin malesuada lectus id ultricies congue.',
    'message': 'Ut non ipsum turpis. In at feugiat magna, eu mattis tortor.',
  },
  {
    'title': 'Praesent id tellus vel purus eleifend porta.',
    'message': 'Duis a justo risus. Ut dignissim gravida mauris at dignissim. Sed ac justo nulla. Ut sit amet metus ac lectus hendrerit volutpat.',
    'attachment': 'https://i.picsum.photos/id/108/160/120.jpg',
  },
  {
    'title': 'Sed sit amet urna vitae nulla cursus consectetur.',
    'message': 'Vivamus ultricies ipsum lacus, quis cursus velit consequat sit amet. Nulla pellentesque sit amet dolor ut bibendum.',
    'attachment': 'https://i.picsum.photos/id/109/160/120.jpg',
  },
  {
    'title': 'Nulla consectetur enim pretium scelerisque posuere.',
    'message': 'Vivamus ultricies ipsum lacus, quis cursus velit consequat sit amet. Nulla pellentesque sit amet dolor ut bibendum.',
    'attachment': 'https://i.picsum.photos/id/110/160/120.jpg',
  },
  {
    'title': 'Integer sodales nulla et enim aliquam, et maximus elit ornare.',
    'message': 'In vel eleifend ligula. Etiam faucibus interdum velit, a accumsan velit facilisis a. Duis tincidunt quam at laoreet cursus.',
    'attachment': 'https://i.picsum.photos/id/111/160/120.jpg',
  },
  {
    'title': 'Morbi volutpat arcu ac metus egestas, eget faucibus dui pellentesque.',
    'message': 'Cras sit amet luctus lacus. Mauris porta fringilla varius. Sed tristique mollis interdum.',
  },
  {
    'title': 'In non orci et arcu accumsan sagittis.',
    'message': 'Nullam egestas convallis quam, et lobortis quam volutpat eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'attachment': 'https://i.picsum.photos/id/112/160/120.jpg',
  },
  {
    'title': 'Duis cursus nibh hendrerit, porttitor nisl nec, cursus purus.',
    'message': 'Quisque sollicitudin luctus sem. Etiam finibus neque ac viverra varius.',
    'attachment': 'https://i.picsum.photos/id/113/160/120.jpg',
  },
  {
    'title': 'Mauris varius nisi in iaculis rutrum.',
    'message': 'Nunc venenatis eros massa, elementum sollicitudin lectus placerat eu. Morbi sodales nisi eget sagittis consectetur.',
    'attachment': 'https://i.picsum.photos/id/114/160/120.jpg',
  },
  {
    'title': 'Duis dapibus tortor et ante tincidunt bibendum.',
    'message': 'Vivamus non elementum eros. Fusce rutrum maximus massa, id consectetur nisl feugiat ac.',
  },
  {
    'title': 'Suspendisse varius dolor sed molestie congue.',
    'message': 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. ',
  }
]

url = 'https://push.notifica.re/notification/push/device/% s'%(deviceId)
headers = { 'Content-Type': 'application/json' }

for i in range(len(notifications)):
  payload = {
    'type': 're.notifica.notification.Alert',
    'title': notifications[i]['title'],
    'message': notifications[i]['message'],
  }

  if 'attachment' in notifications[i]:
    payload['attachments'] = [
      {
        'mimeType': 'image/jpeg',
        'uri': notifications[i]['attachment']
      }
    ]

  requests.post(url, auth=(appId, appMasterSecret), headers=headers, data=json.dumps(payload))
