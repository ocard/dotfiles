import q
from powerline.segments import Segment, with_docstring
from powerline.theme import requires_segment_info

from weather_alert import alerts


class RainSegment:
    # a tick is defined by tmux config, 2 seconds at time of last modification
    updateInterval = 3 # ticks to update
    readInterval = 100 # ticks to read data 
    # max_time = 6 # time segments to check
    tick = 0
    readTick = readInterval-2
    outputs = []
    counter = 0
    def __call__(self, pl, segment_info=None, create_watcher=None):
        RainSegment.readTick += 1
        if RainSegment.readTick >= RainSegment.readInterval:
            info = alerts()
            RainSegment.outputs = []
            if all([True if state[1]=='clear' else False for state in info]): # clear next 18 hours
                return [{'contents':'All clear! ✔', 
                            'gradient_level':0,
                            'highlight_groups':['rain']}]
            for state in info:
                if state[1] != 'clear':
                    RainSegment.outputs.append([state[1] + ' 🔜 ' + state[0],state[2]])
            RainSegment.readTick = 0

        RainSegment.tick += 1
        if RainSegment.tick == RainSegment.updateInterval: 
            RainSegment.counter = (RainSegment.counter + 1) % len(RainSegment.outputs)
            RainSegment.tick = 0
        
        return [{'contents':RainSegment.outputs[RainSegment.counter][0], 
                'gradient_level':RainSegment.outputs[RainSegment.counter][1],
                'highlight_groups':['rain']}]
        # return [{'contents':[RainSegment.outputs,RainSegment.readTick], 
        #         'gradient_level':0,
        #         'highlight_groups':['rain']}]

rain = with_docstring(
    RainSegment(),
    '''Returns alerts for upcoming rain
    Highlight groups used: ``rain``
    ''')
