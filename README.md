# Gunicorn + Flask Docker Template
* Template for when to start making an application
  
```
┌─── Docker ───┐  
│┌Supervisord ┐│  
││ ┌────────┐ ││  
││ │ Nginx  │ ││  
││ └────┬───┘ ││  
││      │     ││  
││ ┌────┴───┐ ││  
││ │Gunicorn│ ││  
││ └────┬───┘ ││  
││      │     ││  
││ ┌────┴───┐ ││  
││ │ Flask  │ ││  
││ └────────┘ ││  
│└────────────┘│  
└──────────────┘  
```
  
- Ubuntu 17
- Supervisord
  - Python 2.7
- Flask and Gunicorn
  - Python 3.6
