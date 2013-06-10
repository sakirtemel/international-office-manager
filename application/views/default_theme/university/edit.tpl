<div class="grid_10">
            <div class="box round first">
                <h2>
                    Üniversite Ekle</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/duzenleUniversite/{$university.universityCode}" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Üniversite Kodu</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="grumble" name="universityCode" value="{$university.universityCode}" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Üniversite Adı</label>
                            </td>
                            <td>
                                <input type="text" class="medium" name="universityName" value="{$university.universityName}" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    Ülke</label>
                            </td>
                            <td>
                                <select id="select" name="select">
                                    <option value="1">Value 1</option>
                                    <option value="2">Value 2</option>
                                    <option value="3">Value 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Şehir</label>
                            </td>
                            <td>
                                <select id="select" name="select">
                                    <option value="1">Value 1</option>
                                    <option value="2">Value 2</option>
                                    <option value="3">Value 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Web</label>
                            </td>
                            <td>
                                <input type="text" class="mini" value="{$university.universityWebsite}" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    Adres</label>
                            </td>
                            <td>
                                <textarea>{$university.universityAddress}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    &nbsp;</label>
                            </td>
                            <td>
                                <button class="btn btn-green">Kaydet</button>
                            </td>
                        </tr>
                        
                        
                    </table>
                    </form>
                </div>
            </div>
        </div>