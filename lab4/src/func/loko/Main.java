package func.loko;

import com.ericsson.otp.erlang.*;

public class Main {


    public static void main(String[] args) throws Exception {
        System.setProperty("OtpConnection.trace", "0");
        OtpNode javaNode = new OtpNode("jNodeSend@127.0.0.1", "loko");
        OtpNode receiveNode = new OtpNode("jNodeRecieve@127.0.0.1", "loko");
        if (javaNode.ping("collector@127.0.0.1", 10000) && javaNode.ping("accumulator@127.0.0.1", 10000)
                && receiveNode.ping("collector@127.0.0.1", 10000) && receiveNode.ping("accumulator@127.0.0.1", 10000)) {
            new MainForm(javaNode, receiveNode);
        }

    }
}
